import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/helper/app_snack_bar_helper.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/widgets/app_bar/widgets.dart';
import 'package:flutter_template/presentation/widgets/buttons/_primary_button.dart';
import 'package:flutter_template/presentation/widgets/custom_bottom_modal_sheet/bottom_sheet.dart';
import 'package:flutter_template/presentation/widgets/dialog/dialog.dart';
import 'package:flutter_template/presentation/widgets/input_widget/widgets.dart';
import 'package:flutter_template/presentation/widgets/others/widgets.dart';

class WidgetsLandscapeView extends StatefulWidget {
  const WidgetsLandscapeView({super.key});

  @override
  State<WidgetsLandscapeView> createState() => _WidgetsLandscapeViewState();
}

class _WidgetsLandscapeViewState extends State<WidgetsLandscapeView> {
  String selectedValue = "male";
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(title: l10n.galleryTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              AppTextField(
                hint: l10n.textFieldLabel,
                label: l10n.fieldLabelGeneric,
              ),
              Gap(8),
              InputDateTimePicker(hintText: l10n.datePickerHint),
              Gap(8),
              PrimaryButton(
                onPressed: () async {
                  bool shouldUpdate = await AppUpdateDialog.show(
                    context,
                    force: false,
                    title: l10n.updateDialogTitle,
                    description: l10n.updateDialogDescription,
                  );

                  if (shouldUpdate && context.mounted) {
                    AppSnackBarHelper.show(
                      context,
                      message: l10n.updateInitiated,
                    );
                  }
                },
                title: l10n.showSoftUpdateDialog,
              ),
              Gap(8),
              DropdownField<String>(
                value: selectedCategory,
                items: [
                  l10n.categoryElectronics,
                  l10n.categoryClothing,
                  l10n.categoryBooks,
                  l10n.categoryFood,
                  l10n.categorySports,
                ],
                hintText: l10n.chooseCategory,
                borderRadius: 8,
                buildTitle: (value) => value,
                onChanged: (value) {
                  setState(() => selectedCategory = value);
                },
              ),
              Gap(8),
              PrimaryButton(onPressed: () {}, title: l10n.buttonExample),
              Gap(8),
              PrimaryButton(
                onPressed: () {
                  CustomBottomModalSheet.open(
                    context,
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 250,
                      decoration: BoxDecoration(
                        color: context.colors.surface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: AppText.titleMedium(l10n.bottomSheetGreeting),
                      ),
                    ),
                    borderRadius: 20,
                  );
                },
                title: l10n.openBottomSheet,
              ),
              Gap(8),
              CustomCheckbox(title: Text(l10n.checkbox)),
              Gap(8),
              RadioGroup<String>(
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() => selectedValue = value!);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<String>(
                      value: "male",
                      title: AppText.titleMedium(l10n.genderMale),
                      activeColor: context.colors.primary,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                    RadioListTile<String>(
                      value: "female",
                      title: AppText.titleMedium(l10n.genderFemale),
                      activeColor: context.colors.primary,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

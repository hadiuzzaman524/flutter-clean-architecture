import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
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

class WidgetsPortraitView extends StatefulWidget {
  const WidgetsPortraitView({super.key});

  @override
  State<WidgetsPortraitView> createState() => _WidgetsPortraitViewState();
}

class _WidgetsPortraitViewState extends State<WidgetsPortraitView> {
  String selectedValue = "male";
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(title: l10n.galleryTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppConstant.horizontalGap16,
            AppConstant.horizontalGap16,
            AppConstant.horizontalGap16,
            // Clear the extended-body bottom navigation bar so the last item
            // stays fully visible above it.
            MediaQuery.of(context).padding.bottom + 90,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.bodySmall(
                l10n.gallerySubtitle,
                color: context.colors.onSurface.withAlpha(150),
                maxLines: 3,
              ),
              Gap(AppConstant.verticalGap16),

              _SectionLabel(l10n.sectionInputs),
              _Block(
                children: [
                  AppTextField(
                    hint: l10n.fieldEmailHint,
                    label: l10n.email,
                    textFieldType: AppTextFieldType.email,
                    fillColor: context.colors.background,
                  ),
                  AppTextField(
                    hint: l10n.fieldPasswordHint,
                    label: l10n.passwordLabel,
                    textFieldType: AppTextFieldType.password,
                    fillColor: context.colors.background,
                  ),
                  AppTextField(
                    hint: l10n.searchLabel,
                    label: l10n.searchLabel,
                    textFieldType: AppTextFieldType.search,
                    fillColor: context.colors.background,
                  ),
                  InputDateTimePicker(
                    hintText: l10n.datePickerHint,
                    fillColor: context.colors.background,
                  ),
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
                    borderRadius: AppConstant.borderRadius8,
                    buildTitle: (value) => value,
                    onChanged: (value) {
                      setState(() => selectedCategory = value);
                    },
                  ),
                ],
              ),

              _SectionLabel(l10n.sectionSelection),
              _Block(
                children: [
                  CustomCheckbox(title: Text(l10n.enableNotifications)),
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

              _SectionLabel(l10n.sectionOverlays),
              _Block(
                children: [
                  PrimaryButton(
                    onPressed: () async {
                      bool shouldUpdate = await AppUpdateDialog.show(
                        context,
                        force: false,
                        title: l10n.updateDialogTitle,
                        description: l10n.updateDialogDescription,
                      );

                      if (shouldUpdate) {
                        if (context.mounted) {
                          AppSnackBarHelper.show(
                            context,
                            message: l10n.updateInitiated,
                          );
                        }
                      }
                    },
                    title: l10n.showDialogButton,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      CustomBottomModalSheet.open(
                        context,
                        Container(
                          padding: EdgeInsets.all(AppConstant.horizontalGap16),
                          height: 250,
                          decoration: BoxDecoration(
                            color: context.colors.surface,
                            borderRadius: BorderRadius.circular(
                              AppConstant.borderRadius20,
                            ),
                          ),
                          child: Center(
                            child: AppText.titleMedium(l10n.bottomSheetGreeting),
                          ),
                        ),
                        borderRadius: AppConstant.borderRadius20,
                      );
                    },
                    title: l10n.openBottomSheet,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Uppercase section eyebrow used to group the gallery.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstant.verticalGap8,
        bottom: AppConstant.verticalGap8,
        left: AppConstant.horizontalGap4,
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          color: context.colors.onSurface.withAlpha(140),
        ),
      ),
    );
  }
}

/// A rounded, elevated container that holds a group of spaced children.
class _Block extends StatelessWidget {
  const _Block({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: AppConstant.verticalGap8),
      padding: EdgeInsets.all(AppConstant.horizontalGap12),
      decoration: BoxDecoration(
        color: theme.surfaceElevated,
        borderRadius: BorderRadius.circular(AppConstant.borderRadius16),
        border: Border.all(color: theme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1) Gap(AppConstant.verticalGap12),
          ],
        ],
      ),
    );
  }
}

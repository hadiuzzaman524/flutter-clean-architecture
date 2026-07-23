import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/helper/app_snack_bar_helper.dart';
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
    return Scaffold(
      appBar: CustomAppBar(title: "Component Gallery"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              AppTextField(hint: "Text Field", label: "Label"),
              Gap(8),
              InputDateTimePicker(hintText: 'Date Picker'),
              Gap(8),
              PrimaryButton(
                onPressed: () async {
                  bool shouldUpdate = await AppUpdateDialog.show(
                    context,
                    force: false,
                    title: "App Update Available",
                    description:
                        "A new version of the app is available. Please update to get the latest features and bug fixes.",
                  );

                  if (shouldUpdate && context.mounted) {
                    AppSnackBarHelper.show(
                      context,
                      message: "Update initiated",
                    );
                  }
                },
                title: "Show Soft Update Dialog",
              ),
              Gap(8),
              DropdownField<String>(
                value: selectedCategory,
                items: const [
                  "Electronics",
                  "Clothing",
                  "Books",
                  "Food",
                  "Sports",
                ],
                hintText: "Choose category",
                borderRadius: 8,
                buildTitle: (value) => value,
                onChanged: (value) {
                  setState(() => selectedCategory = value);
                },
              ),
              Gap(8),
              PrimaryButton(onPressed: () {}, title: "Button Example"),
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
                        child: AppText.titleMedium(
                          "Hello from the bottom sheet!",
                        ),
                      ),
                    ),
                    borderRadius: 20,
                  );
                },
                title: "Open Bottom Sheet",
              ),
              Gap(8),
              CustomCheckbox(title: Text("Check Box")),
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
                      title: AppText.titleMedium("Male"),
                      activeColor: context.colors.primary,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                    RadioListTile<String>(
                      value: "female",
                      title: AppText.titleMedium("Female"),
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

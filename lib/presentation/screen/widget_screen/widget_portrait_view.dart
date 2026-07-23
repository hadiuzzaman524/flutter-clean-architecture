import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/core/helper/app_snack_bar_helper.dart';
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
    return Scaffold(
      appBar: const CustomAppBar(title: "Component Gallery"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppConstant.horizontalGap16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.bodySmall(
                'The template’s reusable widgets, grouped by role — all driven '
                'by the shared theme tokens.',
                color: context.colors.onSurface.withAlpha(150),
                maxLines: 3,
              ),
              Gap(AppConstant.verticalGap16),

              const _SectionLabel("Inputs"),
              _Block(
                children: [
                  AppTextField(
                    hint: "Add Email",
                    label: "Email",
                    textFieldType: AppTextFieldType.email,
                    fillColor: context.colors.background,
                  ),
                  AppTextField(
                    hint: "Add Password",
                    label: "Password",
                    textFieldType: AppTextFieldType.password,
                    fillColor: context.colors.background,
                  ),
                  AppTextField(
                    hint: "Search",
                    label: "Search",
                    textFieldType: AppTextFieldType.search,
                    fillColor: context.colors.background,
                  ),
                  InputDateTimePicker(
                    hintText: 'Date Picker',
                    fillColor: context.colors.background,
                  ),
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
                    borderRadius: AppConstant.borderRadius8,
                    buildTitle: (value) => value,
                    onChanged: (value) {
                      setState(() => selectedCategory = value);
                    },
                  ),
                ],
              ),

              const _SectionLabel("Selection"),
              _Block(
                children: [
                  const CustomCheckbox(title: Text("Enable notifications")),
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

              const _SectionLabel("Overlays & actions"),
              _Block(
                children: [
                  PrimaryButton(
                    onPressed: () async {
                      bool shouldUpdate = await AppUpdateDialog.show(
                        context,
                        force: false,
                        title: "App Update Available",
                        description:
                            "A new version of the app is available. Please "
                            "update to get the latest features and bug fixes.",
                      );

                      if (shouldUpdate) {
                        if (context.mounted) {
                          AppSnackBarHelper.show(
                            context,
                            message: "Update initiated",
                          );
                        }
                      }
                    },
                    title: "Show Dialog",
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
                            child: AppText.titleMedium(
                              "Hello from the bottom sheet!",
                            ),
                          ),
                        ),
                        borderRadius: AppConstant.borderRadius20,
                      );
                    },
                    title: "Open Bottom Sheet",
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/core/helper/app_snack_bar_helper.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';
import 'package:tsl_flutter_template/presentation/widgets/app_bar/widgets.dart';
import 'package:tsl_flutter_template/presentation/widgets/buttons/_primary_button.dart';
import 'package:tsl_flutter_template/presentation/widgets/custom_bottom_modal_sheet/bottom_sheet.dart';
import 'package:tsl_flutter_template/presentation/widgets/dialog/dialog.dart';
import 'package:tsl_flutter_template/presentation/widgets/input_widget/widgets.dart';
import 'package:tsl_flutter_template/presentation/widgets/others/widgets.dart';

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
      appBar: const CustomAppBar(title: "Widgets Screen"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppConstant.horizontalGap12),
          child: Column(
            children: [
              AppTextField(
                hint: "Add Email",
                label: "Email",
                textFieldType: AppTextFieldType.email,
                fillColor: context.colors.surface,
              ),
              Gap(AppConstant.verticalGap8),
               AppTextField(
                hint: "Add Password",
                label: "Password",
                textFieldType: AppTextFieldType.password,
                fillColor: context.colors.surface,
              ),
              Gap(AppConstant.verticalGap8),
               AppTextField(
                hint: "Search",
                label: "Search",
                textFieldType: AppTextFieldType.search,
                fillColor: context.colors.surface,
              ),
              Gap(AppConstant.verticalGap8),
              AppTextField(
                hint: "Text",
                label: "Text",
                fillColor: context.colors.surface,
              ),
              Gap(AppConstant.verticalGap8),
              InputDateTimePicker(
                hintText: 'Date Picker',
                fillColor: context.colors.surface,
              ),
              Gap(AppConstant.verticalGap8),
              PrimaryButton(
                onPressed: () async {
                  bool shouldUpdate = await AppUpdateDialog.show(
                    context,
                    force: false,
                    title: "App Update Available",
                    description:
                        "A new version of the app is available. Please update to get the latest features and bug fixes.",
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
              Gap(AppConstant.verticalGap8),
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
              Gap(AppConstant.verticalGap8),
              PrimaryButton(onPressed: () {}, title: "Button Example"),
              Gap(AppConstant.verticalGap8),
              PrimaryButton(
                onPressed: () {
                  CustomBottomModalSheet.open(
                    context,
                    Container(
                      padding: EdgeInsets.all(AppConstant.horizontalGap16),
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppConstant.borderRadius20,
                        ),
                      ),
                      child: const Center(
                        child: Text("Hello from Bottom Sheet!"),
                      ),
                    ),
                    borderRadius: AppConstant.borderRadius20,
                  );
                },
                title: "Open Bottom Sheet",
              ),
              Gap(AppConstant.verticalGap8),
              const CustomCheckbox(title: Text("Check Box")),
              Gap(AppConstant.verticalGap8),
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

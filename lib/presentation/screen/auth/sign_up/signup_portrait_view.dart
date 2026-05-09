import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';
import 'package:tsl_flutter_template/presentation/widgets/buttons/_primary_button.dart';
import 'package:tsl_flutter_template/presentation/widgets/input_widget/widgets.dart';

import 'cubit/signup_cubit.dart';

class SignupPortraitView extends StatefulWidget {
  const SignupPortraitView({super.key});

  @override
  State<SignupPortraitView> createState() => _SignupPortraitViewState();
}

class _SignupPortraitViewState extends State<SignupPortraitView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final pinController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    pinController.dispose();
    super.dispose();
  }

  Future<void> _onSignup() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    context.read<SignupCubit>().signup(
      SignupEntity(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        pin: pinController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return Scaffold(
      backgroundColor: theme.background,
      body: Stack(
        children: [
          // Background Decorative Element
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    theme.secondary.withAlpha(26),
                    theme.secondary.withAlpha(0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: BlocListener<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state.signupStatus.isFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Signup failed"),
                      backgroundColor: theme.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }

                if (state.signupStatus.isSuccess) {
                  context.router.replace(const HomeRoute());
                }
              },
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: AppConstant.horizontalGap20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      children: [
                        // Header Section
                        Container(
                          padding: EdgeInsets.all(AppConstant.horizontalGap20),
                          decoration: BoxDecoration(
                            color: theme.primary.withAlpha(26),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_add_rounded,
                            size: 64,
                            color: theme.primary,
                          ),
                        ),
                        Gap(AppConstant.verticalGap20),
                        AppText.displayMedium(
                          "Create Account",
                          style: context.textStyle.displaySmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.onBackground,
                          ),
                        ),
                        Gap(AppConstant.verticalGap8),
                        AppText.bodyMedium(
                          "Fill in your details to get started",
                          style: context.textStyle.bodyMedium.copyWith(
                            color: theme.onSurface.withAlpha(153),
                          ),
                        ),
                        Gap(AppConstant.verticalGap20 * 1.5),

                        // Signup Card
                        Container(
                          padding: EdgeInsets.all(AppConstant.horizontalGap20 + 4),
                          decoration: BoxDecoration(
                            color: theme.surface,
                            borderRadius: BorderRadius.circular(AppConstant.borderRadius20),
                            border: Border.all(color: theme.border.withAlpha(128)),
                            boxShadow: [
                              BoxShadow(
                                color: theme.shadow.withAlpha(13),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// NAME
                                AppText.labelLarge(
                                  "Full Name",
                                  style: context.textStyle.labelLarge.copyWith(fontWeight: FontWeight.w600),
                                ),
                                Gap(AppConstant.verticalGap8),
                                AppTextField(
                                  controller: nameController,
                                  hint: "Enter your full name",
                                  textFieldType: AppTextFieldType.none,
                                  prefixIcon: const Icon(Icons.person_outline),
                                ),
                                Gap(AppConstant.verticalGap16),

                                /// EMAIL
                                AppText.labelLarge(
                                  "Email Address",
                                  style: context.textStyle.labelLarge.copyWith(fontWeight: FontWeight.w600),
                                ),
                                Gap(AppConstant.verticalGap8),
                                AppTextField(
                                  controller: emailController,
                                  hint: "Enter your email",
                                  textFieldType: AppTextFieldType.email,
                                ),
                                Gap(AppConstant.verticalGap16),

                                /// PIN
                                AppText.labelLarge(
                                  "PIN (4-6 digits)",
                                  style: context.textStyle.labelLarge.copyWith(fontWeight: FontWeight.w600),
                                ),
                                Gap(AppConstant.verticalGap8),
                                AppTextField(
                                  controller: pinController,
                                  hint: "Enter your PIN",
                                  textFieldType: AppTextFieldType.number,
                                ),
                                Gap(AppConstant.verticalGap20 * 1.5),

                                /// SIGNUP BUTTON
                                SizedBox(
                                  width: double.infinity,
                                  child: PrimaryButton(
                                    onPressed: _onSignup,
                                    title: "Sign Up",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(AppConstant.verticalGap20),

                        // Login Toggle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText.bodyMedium(
                              "Already have an account?",
                              color: theme.onSurface.withAlpha(179),
                            ),
                            TextButton(
                              onPressed: () => context.replaceRoute(const LogInRoute()),
                              child: AppText.bodyLarge(
                                "Login",
                                style: TextStyle(
                                  color: theme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(AppConstant.verticalGap20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

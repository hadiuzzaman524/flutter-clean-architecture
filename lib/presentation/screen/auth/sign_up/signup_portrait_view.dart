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
      body: SafeArea(
        child: BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state.signupStatus.isFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Signup failed"),
                  backgroundColor: theme.error,
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
                child: Container(
                  padding: EdgeInsets.all(AppConstant.horizontalGap20 + 4), // Equivalent to 24
                  decoration: BoxDecoration(
                    color: theme.surface,
                    borderRadius: BorderRadius.circular(AppConstant.borderRadius20),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadow.withOpacity(0.1),
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
                        /// HEADER
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.person_add_alt_1_rounded,
                                size: 50,
                                color: theme.primary,
                              ),
                              Gap(AppConstant.verticalGap12),
                              AppText.headlineSmall(
                                "Create Account",
                                style: context.textStyle.headlineMedium
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Gap(AppConstant.verticalGap8),
                              Text(
                                "Sign up to get started",
                                textAlign: TextAlign.center,
                                style: context.textStyle.bodyMedium.copyWith(
                                  color: theme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Gap(AppConstant.verticalGap20 + 4), // Equivalent to 24

                        /// NAME
                        Text("Name", style: context.textStyle.labelMedium),
                        Gap(AppConstant.verticalGap8),
                        AppTextField(
                          controller: nameController,
                          hint: "Your full name",
                          textFieldType: AppTextFieldType.none,
                        ),

                        Gap(AppConstant.verticalGap16),

                        /// EMAIL
                        Text("Email", style: context.textStyle.labelMedium),
                        Gap(AppConstant.verticalGap8),
                        AppTextField(
                          controller: emailController,
                          hint: "example@email.com",
                          textFieldType: AppTextFieldType.email,
                        ),

                        Gap(AppConstant.verticalGap16),

                        /// PIN
                        Text("PIN", style: context.textStyle.labelMedium),
                        Gap(AppConstant.verticalGap8),
                        AppTextField(
                          controller: pinController,
                          hint: "4-6 digit PIN",
                          textFieldType: AppTextFieldType.number,
                        ),

                        Gap(AppConstant.verticalGap20 + 4), // Equivalent to 24

                        /// SIGNUP BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            onPressed: _onSignup,
                            title: "Sign Up",
                            backgroundColor: theme.primary,
                            borderColor: theme.primary,
                            titleColor: theme.onPrimary,
                            loadingColor: theme.onPrimary,
                          ),
                        ),

                        Gap(AppConstant.verticalGap16),

                        /// LOGIN NAVIGATION
                        Center(
                          child: TextButton(
                            onPressed: () {
                              context.replaceRoute(const LogInRoute());
                            },
                            child: Text(
                              "Already have an account? Login",
                              style: TextStyle(color: theme.primary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

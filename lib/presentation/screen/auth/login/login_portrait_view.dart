import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/core/error/error_localization.dart';
import 'package:tsl_flutter_template/core/state_status/base_status.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';
import 'package:tsl_flutter_template/presentation/widgets/buttons/_primary_button.dart';
import 'package:tsl_flutter_template/presentation/widgets/input_widget/widgets.dart';

import 'cubit/login_cubit.dart';

class LogInPortraitView extends StatefulWidget {
  const LogInPortraitView({super.key});

  @override
  State<LogInPortraitView> createState() => _LogInPortraitViewState();
}

class _LogInPortraitViewState extends State<LogInPortraitView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pinController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    pinController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController.text = 'test@gmail.com';
    pinController.text = '1234';
  }

  Future<void> _onLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    context.read<LoginCubit>().login(
      LoginEntity(
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
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.loginStatus.isFailure) {
              final error = (state.loginStatus as Failure).responseError;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.errorLocalization.responseError(error)),
                  backgroundColor: theme.error,
                ),
              );
            }

            if (state.loginStatus.isSuccess) {
              context.router.replace(const HomeRoute());
            }
          },
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppConstant.horizontalGap20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Container(
                  padding: EdgeInsets.all(AppConstant.horizontalGap20),
                  decoration: BoxDecoration(
                    color: theme.surface,
                    borderRadius: BorderRadius.circular(AppConstant.borderRadius20),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadow.withAlpha(20),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// HEADER
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.lock_rounded,
                                size: 42,
                                color: theme.primary,
                              ),
                              Gap(AppConstant.verticalGap12),
                              AppText.headlineSmall(
                                "SIGN IN",
                                style: context.textStyle.headlineMedium
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Gap(AppConstant.verticalGap12),
                              AppText.headlineSmall(
                                "Welcome back, please login to continue",
                                style: context.textStyle.bodyMedium.copyWith(
                                  color: theme.onSurface,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        Gap(AppConstant.verticalGap12),

                        /// EMAIL
                        AppText.labelLarge(
                          context.l10n.email,
                          style: context.textStyle.labelMedium,
                        ),
                        Gap(AppConstant.verticalGap12),
                        AppTextField(
                          controller: emailController,
                          hint: "example@email.com",
                          textFieldType: AppTextFieldType.email,
                        ),

                        Gap(AppConstant.verticalGap12),

                        /// PIN
                        AppText.labelLarge(
                          context.l10n.pin,
                          style: context.textStyle.labelMedium,
                        ),
                        Gap(AppConstant.verticalGap12),
                        AppTextField(
                          controller: pinController,
                          hint: "••••",
                          textFieldType: AppTextFieldType.number,
                        ),

                        Gap(AppConstant.verticalGap12),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            onPressed: _onLogin,
                            title: context.l10n.login,
                            backgroundColor: theme.primary,
                            borderColor: theme.primary,
                            titleColor: theme.onPrimary,
                            loadingColor: theme.onPrimary,
                          ),
                        ),

                        Gap(AppConstant.verticalGap12),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            onPressed: () =>
                                context.pushRoute(const SignupRoute()),
                            title: "Register / Sign Up",
                            backgroundColor: theme.secondary,
                            borderColor: theme.primary,
                            titleColor: theme.onPrimary,
                            loadingColor: theme.onPrimary,
                          ),
                        ),
                        Gap(AppConstant.verticalGap12),
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

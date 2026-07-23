import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/core/error/error_localization.dart';
import 'package:flutter_template/core/state_status/base_status.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/route/app_router.gr.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/widgets/buttons/_primary_button.dart';
import 'package:flutter_template/presentation/widgets/input_widget/widgets.dart';

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
      backgroundColor: theme.background,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    theme.primary.withAlpha(38),
                    theme.primary.withAlpha(0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.loginStatus.isFailure) {
                  final error = (state.loginStatus as Failure).responseError;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        context.errorLocalization.responseError(error),
                      ),
                      backgroundColor: theme.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
                if (state.loginStatus.isSuccess) {
                  context.router.replace(const HomeRoute());
                }
              },
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstant.horizontalGap20,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppConstant.horizontalGap20),
                          decoration: BoxDecoration(
                            color: theme.primary.withAlpha(26),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.lock_person_rounded,
                            size: 64,
                            color: theme.primary,
                          ),
                        ),
                        Gap(AppConstant.verticalGap20),
                        AppText.displayMedium(
                          "Welcome Back",
                          style: context.textStyle.displaySmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.onBackground,
                          ),
                        ),
                        Gap(AppConstant.verticalGap8),
                        AppText.bodyMedium(
                          "Login to your account to continue",
                          style: context.textStyle.bodyMedium.copyWith(
                            color: theme.onSurface.withAlpha(153),
                          ),
                        ),
                        Gap(AppConstant.verticalGap20 * 1.5),

                        // Login Card
                        Container(
                          padding: EdgeInsets.all(
                            AppConstant.horizontalGap20 + 4,
                          ),
                          decoration: BoxDecoration(
                            color: theme.surfaceElevated,
                            borderRadius: BorderRadius.circular(
                              AppConstant.borderRadius20,
                            ),
                            border: Border.all(color: theme.border),
                            boxShadow: [
                              BoxShadow(
                                color: theme.shadow.withAlpha(40),
                                blurRadius: 24,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.labelLarge(
                                  context.l10n.email,
                                  style: context.textStyle.labelLarge.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Gap(AppConstant.verticalGap8),
                                AppTextField(
                                  controller: emailController,
                                  hint: "Enter your email",
                                  textFieldType: AppTextFieldType.email,
                                  fillColor: context.colors.background,
                                ),
                                Gap(AppConstant.verticalGap20),
                                AppText.labelLarge(
                                  context.l10n.pin,
                                  style: context.textStyle.labelLarge.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Gap(AppConstant.verticalGap8),
                                AppTextField(
                                  controller: pinController,
                                  hint: "Enter your PIN",
                                  textFieldType: AppTextFieldType.number,
                                  fillColor: context.colors.background,
                                ),
                                Gap(AppConstant.verticalGap20 * 1.5),
                                SizedBox(
                                  width: double.infinity,
                                  child: PrimaryButton(
                                    onPressed: _onLogin,
                                    title: context.l10n.login,
                                  ),
                                ),
                                Gap(AppConstant.verticalGap12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppConstant.horizontalGap8,
                                        vertical: AppConstant.verticalGap4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: theme.primary.withAlpha(23),
                                        borderRadius: BorderRadius.circular(
                                          AppConstant.borderRadius8,
                                        ),
                                      ),
                                      child: AppText.labelSmall(
                                        'DEMO',
                                        color: theme.primary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Gap(AppConstant.horizontalGap8),
                                    Flexible(
                                      child: AppText.bodySmall(
                                        'Prefilled test@gmail.com / 1234',
                                        color: theme.onSurface.withAlpha(140),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
        ],
      ),
    );
  }
}

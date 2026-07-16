import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/core/cubit/device_status/device_status_cubit.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class InternetOverlay extends StatelessWidget {
  const InternetOverlay({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BlocBuilder<DeviceStatusCubit, DeviceStatusState>(
        builder: (context, state) {
          bool connected = state.hasInternet;
          Logger().e("Internet Connection $connected");

          return Stack(
            children: [
              child,
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 500),
                  offset: !connected ? Offset.zero : const Offset(0, 1),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: !connected ? 1.0 : 0.0,
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ColoredBox(
                        color: context.colors.error,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstant.horizontalGap16,
                            vertical: AppConstant.verticalGap8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                size: AppConstant.horizontalGap20,
                              ),
                              Gap(AppConstant.horizontalGap12),
                              AppText.labelLarge("No Internet Connection !"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

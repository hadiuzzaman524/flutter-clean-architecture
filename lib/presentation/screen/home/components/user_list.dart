import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/core/error/error_localization.dart';
import 'package:tsl_flutter_template/core/error/response_error.dart';
import 'package:tsl_flutter_template/core/state_status/base_status.dart';
import 'package:tsl_flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:tsl_flutter_template/presentation/screen/home/cubits/user_state.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (ctx, state) {
        final userList = state.userList;
        return switch (state.status) {
          Loading() => const Center(child: CircularProgressIndicator()),
          Success() => ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: context.colors.primary,
                  radius: 35,
                  child: Icon(
                    Icons.person_4_outlined,
                    color: context.colors.onPrimary,
                  ),
                ),
                title: AppText.titleLarge(userList[index].name),
                subtitle: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleSmall(userList[index].email),
                    AppText.titleSmall(userList[index].address),
                    AppText.titleSmall(userList[index].city),
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, index) =>
                Divider(color: context.colors.border),
            itemCount: userList.length,
          ),
          Failure(:final ResponseError responseError) => Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.horizontalGap8,
                vertical: AppConstant.verticalGap8,
              ),
              child: AppText.bodyLarge(
                context.errorLocalization.responseError(responseError),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

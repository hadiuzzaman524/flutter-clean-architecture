import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsl_flutter_template/presentation/home/cubits/user_cubit.dart';
import 'package:tsl_flutter_template/presentation/home/cubits/user_state.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (ctx, state) {
        final userList = state.userList;
        return ListView.separated(
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
          separatorBuilder: (ctx, index) => Divider(
            color: context.colors.border,
          ),
          itemCount: userList.length,
        );
      },
    );
  }
}

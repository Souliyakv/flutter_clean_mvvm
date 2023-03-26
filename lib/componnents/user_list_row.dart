import 'package:clean_mvvm/componnents/app_title.dart';
import 'package:clean_mvvm/users_list/models/users_list_model.dart';
import 'package:clean_mvvm/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../users_list/view_models/users_view_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function onPressed;
  const UserListRow({required this.userModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return GestureDetector(
      onTap: () {
        usersViewModel.setSelectedUser(userModel);
        openUserDetails(context);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userModel.username,
            ),
            Text(
              userModel.email.toString(),
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

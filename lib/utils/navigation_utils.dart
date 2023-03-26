import 'package:clean_mvvm/users_list/views/add_user_screen.dart';
import 'package:clean_mvvm/users_list/views/user_details_screen.dart';
import 'package:flutter/material.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return UserDetailsScreen();
  }));
}

void openAddUser(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return const AddUserScreen();
  }));
}

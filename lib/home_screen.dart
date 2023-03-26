import 'package:clean_mvvm/componnents/app_loading.dart';
import 'package:clean_mvvm/componnents/user_list_row.dart';
import 'package:clean_mvvm/users_list/models/users_list_model.dart';
import 'package:clean_mvvm/users_list/view_models/users_view_model.dart';
import 'package:clean_mvvm/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                openAddUser(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [_ui(usersViewModel)],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const AppLoading();
    }
    // if (usersViewModel.userError != null) {
    //   return Container();
    // }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, indec) {
              UserModel userModel = usersViewModel.userListModel[indec];
              return UserListRow(
                onPressed: () {},
                userModel: userModel,
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: usersViewModel.userListModel.length));
  }
}

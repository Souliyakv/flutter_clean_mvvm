import 'package:clean_mvvm/users_list/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        actions: [
          IconButton(
              onPressed: () async {
                bool userAdd = await usersViewModel.addUser();
                if (!userAdd) {
                  return;
                }
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              onChanged: (val) async {
                usersViewModel.addingUser.username = val;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (val) async {
                usersViewModel.addingUser.email = val;
              },
            ),
          ],
        ),
      ),
    );
  }
}

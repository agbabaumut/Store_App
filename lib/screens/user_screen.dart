import 'package:flutter/material.dart';
import 'package:store_app/widgets/users_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: ((context, index) {
          return const UsersWidget();
        }),
      ),
    );
  }
}

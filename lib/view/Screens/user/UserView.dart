import 'package:flutter/material.dart';

import '../../../controller/UserController.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _userController = new UserController();

  Future _allUser() async {
    try {
      var userList = await _userController.getAll();
      userList.forEach((user) {
        print(user.toJson());
      });
    } catch (e) {
      print(e);
    }
  }

  Future _oneUser() async {
    try {
      var user = await _userController.getOne(1);
      print(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future _create() async {
    Map<String, dynamic> newUser = {
      "name": "Sunil Karmakar",
      "age": 22,
      "married": true,
      "skills": ["C#", "Asp.net", "Angular"],
      "university": {"name": "North South", "address": "Rampuara"}
    };
    try {
      var user = await _userController.post(newUser);
      print(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future _update() async {
    Map<String, dynamic> editUser = {
      "name": "Sunil",
      "age": 35,
      "married": false,
      "skills": ["C##", "Asp dot net", "Angular js"],
      "university": {"name": "North", "address": "abc"}
    };
    try {
      var user = await _userController.put(2, editUser);
      print(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future _delete() async {
    try {
      var result = await _userController.delete(2);
      print(result);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _allUser, child: const Text('All User')),
            ElevatedButton(onPressed: _oneUser, child: const Text('One User')),
            ElevatedButton(
                onPressed: _create, child: const Text('Create User')),
            ElevatedButton(
                onPressed: _update, child: const Text('Update User')),
            ElevatedButton(
                onPressed: _delete, child: const Text('Delete User')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

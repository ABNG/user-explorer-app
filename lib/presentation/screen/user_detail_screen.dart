import 'package:flutter/material.dart';
import 'package:user_explorer/data/model/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name ?? 'User Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Name'),
                  subtitle: Text(user.name ?? 'N/A'),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(user.email ?? 'N/A'),
                ),
                ListTile(
                  title: const Text('Phone'),
                  subtitle: Text(user.phone ?? 'N/A'),
                ),
                ListTile(
                  title: const Text('Address'),
                  subtitle: Text(
                    "${user.address?.street}\n${user.address?.city}\n${user.address?.zipcode}",
                  ),
                ),
                ListTile(
                  title: const Text('Company'),
                  subtitle: Text(user.company?.name ?? 'N/A'),
                ),
                ListTile(
                  title: const Text('Website'),
                  subtitle: Text(user.website ?? 'N/A'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

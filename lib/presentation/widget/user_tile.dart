import 'package:flutter/material.dart';

import '../../data/model/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(user.name?[0] ?? 'U')),
      title: Text(user.name ?? 'Unknown'),
      subtitle: Text(user.email ?? 'No email'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

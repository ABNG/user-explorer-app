import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/model/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  Color getRandomColor() {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.brown,
    ];
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatarColor = getRandomColor();
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor.withValues(alpha: 0.2),
        child: Text(
          user.name?.substring(0, 1) ?? 'U',
          style: theme.textTheme.titleMedium?.copyWith(color: avatarColor),
        ),
      ),
      title: Text(
        user.name ?? 'Unknown',
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        user.email ?? 'No email',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: theme.iconTheme.color,
      ),
      onTap: onTap,
    );
  }
}

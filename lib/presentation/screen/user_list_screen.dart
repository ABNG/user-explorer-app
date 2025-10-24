import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_explorer/presentation/screen/user_detail_screen.dart';

import '../../core/di/injection.dart';
import '../../domain/repository/user_repository.dart';
import '../cubit/user/user_cubit.dart';
import '../widget/user_tile.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserCubit(userRepository: getIt<UserRepository>())..getUsers(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return switch (state) {
              UserLoading() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              UserData(users: final users) => RefreshIndicator(
                onRefresh: () => context.read<UserCubit>().getUsers(),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserTile(
                      user: user,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailScreen(user: user),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              UserError(message: final message) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.red, fontSize: 16.0),
                  ),
                ),
              ),
              UserEmpty(message: final message) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(message, style: const TextStyle(fontSize: 16.0)),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}

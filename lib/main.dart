import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_explorer/core/manager/app_bloc_observer.dart';
import 'package:user_explorer/presentation/cubit/theme/theme_cubit.dart';
import 'package:user_explorer/presentation/screen/user_list_screen.dart';

import 'core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const AppBlocProvider());
}

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ThemeCubit(), child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeCubit>().state,
      home: const UserListScreen(),
    );
  }
}

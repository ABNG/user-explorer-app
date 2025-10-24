import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggle() =>
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) =>
      json['theme_mode'] == 'light' ? ThemeMode.light : ThemeMode.dark;

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => state == ThemeMode.light
      ? {'theme_mode': 'light'}
      : {'theme_mode': 'dark'};
}

import 'package:bloc/bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sarraf/feature/settings/logic/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.system));

  void toggleTheme(bool isDark) {
    emit(ThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }
}

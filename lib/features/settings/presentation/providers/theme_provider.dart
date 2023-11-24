import 'package:barber_haircut_mobile/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

//* con este el dato es inmutable
final colorsListProvider = Provider((ref) => colorList);

final appThemeProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorTheme(int colorTheme) {
    state = state.copyWith(selectedColor: colorTheme);
  }
}

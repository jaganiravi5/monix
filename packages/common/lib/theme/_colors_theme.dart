part of  'theme.dart';
abstract class _MyColors {
  static const Color primary = Color.fromRGBO(59, 182, 255, 1.0);
  static const Color secondary = Color(0xFFDEE3E8);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color red = Color(0xffBE2845);
  static const Color darkGrey = Color(0xFF333333);
  static const Color outline = Color(0xFFDEE3E8);
  static const Color divider = Color(0xffB3B3B3);
  static const Color transparent = Color(0x00000000);
}


const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _MyColors.primary,
  onPrimary: _MyColors.black,
  secondary: _MyColors.secondary,
  onSecondary: _MyColors.black,
  error: _MyColors.red,
  onError: _MyColors.red,
  background: _MyColors.white,
  onBackground: _MyColors.black,
  surface: _MyColors.white,
  onSurface: _MyColors.black,
  outline: _MyColors.outline,
  tertiary: _MyColors.divider,
);
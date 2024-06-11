part of 'theme.dart';

@immutable
class MonixColors extends ThemeExtension<MonixColors> {
  const MonixColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.black,
    required this.white,
    required this.bgColor,
    required this.grey500,
    required this.secondary1,
    required this.secondary2,
    required this.bgSolidColor,
    required this.borderColor,
    required this.lightPrimary,
    required this.hintText,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color black;
  final Color white;
  final Color bgColor;
  final Color grey500;
  final Color secondary1;
  final Color secondary2;
  final Color bgSolidColor;
  final Color borderColor;
  final Color lightPrimary;
  final Color hintText;

  @override
  MonixColors copyWith() {
    // We don't use copyWith for the moment
    // Colors are not well defined enough to maintain this
    throw UnimplementedError();
  }

  @override
  ThemeExtension<MonixColors> lerp(
    ThemeExtension<MonixColors>? other,
    double t,
  ) {
    // We don't use colors lerp for the moment
    // Colors are not well defined enough to maintain this
    if (other == null) return this;
    return t < .5 ? this : other;
  }
}

MonixColors myColorsExtension = const MonixColors(
    primary: Color(0xff283046),
    onPrimary: Color(0xff1A5DF7),
    secondary: Color(0xffECFCFE),
    onSecondary: Color(0xff000000),
    black: Color(0xff000000),
    white: Color(0xffffffff),
    bgColor: Color(0xff160D27),
    grey500: Color(0xffADB5BD),
    secondary1: Color(0xFFEC202A),
    secondary2: Color(0xffD74011),
    bgSolidColor: Color(0xff261C39),
    borderColor: Color(0xFF4F3D73),
    lightPrimary: Color(0xff261C39),
    hintText: Color(0xff8D81A4));

extension MonixColorsExtensions on ThemeData {
  MonixColors get monixColors => extension<MonixColors>()!;
}

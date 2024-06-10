/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/icons/camera.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/idea.svg
  SvgGenImage get idea => const SvgGenImage('assets/icons/idea.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/microphone.png
  AssetGenImage get microphone =>
      const AssetGenImage('assets/icons/microphone.png');

  /// File path: assets/icons/monixAi.svg
  SvgGenImage get monixAi => const SvgGenImage('assets/icons/monixAi.svg');

  /// File path: assets/icons/monix_ai_fill.svg
  SvgGenImage get monixAiFill =>
      const SvgGenImage('assets/icons/monix_ai_fill.svg');

  /// File path: assets/icons/no_image.svg
  SvgGenImage get noImage => const SvgGenImage('assets/icons/no_image.svg');

  /// File path: assets/icons/portrait.svg
  SvgGenImage get portrait => const SvgGenImage('assets/icons/portrait.svg');

  /// File path: assets/icons/recordings.svg
  SvgGenImage get recordings =>
      const SvgGenImage('assets/icons/recordings.svg');

  /// File path: assets/icons/saved.svg
  SvgGenImage get saved => const SvgGenImage('assets/icons/saved.svg');

  /// File path: assets/icons/saved_fill.svg
  SvgGenImage get savedFill => const SvgGenImage('assets/icons/saved_fill.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/search_fill.svg
  SvgGenImage get searchFill =>
      const SvgGenImage('assets/icons/search_fill.svg');

  /// File path: assets/icons/square.svg
  SvgGenImage get square => const SvgGenImage('assets/icons/square.svg');

  /// File path: assets/icons/stop_recording.png
  AssetGenImage get stopRecording =>
      const AssetGenImage('assets/icons/stop_recording.png');

  /// List of all assets
  List<dynamic> get values => [
        camera,
        home,
        idea,
        menu,
        microphone,
        monixAi,
        monixAiFill,
        noImage,
        portrait,
        recordings,
        saved,
        savedFill,
        search,
        searchFill,
        square,
        stopRecording
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/buttonBG.png
  AssetGenImage get buttonBG =>
      const AssetGenImage('assets/images/buttonBG.png');

  /// File path: assets/images/generating_ai.png
  AssetGenImage get generatingAi =>
      const AssetGenImage('assets/images/generating_ai.png');

  /// File path: assets/images/image_placeholder.jpeg
  AssetGenImage get imagePlaceholder =>
      const AssetGenImage('assets/images/image_placeholder.jpeg');

  /// File path: assets/images/onboard1.png
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/images/onboard1.png');

  /// File path: assets/images/onboard2.png
  AssetGenImage get onboard2 =>
      const AssetGenImage('assets/images/onboard2.png');

  /// File path: assets/images/star.png
  AssetGenImage get star => const AssetGenImage('assets/images/star.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [buttonBG, generatingAi, imagePlaceholder, onboard1, onboard2, star];
}

class MonixAssets {
  MonixAssets._();

  static const String package = 'monix_assets';

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  static const String package = 'monix_assets';

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/monix_assets/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  static const String package = 'monix_assets';

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/monix_assets/$_assetName';
}

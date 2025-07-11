/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart' as _lottie;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Ping-Black.otf
  String get pingBlack => 'assets/fonts/Ping-Black.otf';

  /// File path: assets/fonts/Ping-Bold.otf
  String get pingBold => 'assets/fonts/Ping-Bold.otf';

  /// File path: assets/fonts/Ping-Light.otf
  String get pingLight => 'assets/fonts/Ping-Light.otf';

  /// File path: assets/fonts/Ping-Medium.otf
  String get pingMedium => 'assets/fonts/Ping-Medium.otf';

  /// File path: assets/fonts/Ping-Regular.otf
  String get pingRegular => 'assets/fonts/Ping-Regular.otf';

  /// List of all assets
  List<String> get values => [
    pingBlack,
    pingBold,
    pingLight,
    pingMedium,
    pingRegular,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/accura-logo.png
  AssetGenImage get accuraLogo =>
      const AssetGenImage('assets/images/accura-logo.png');

  /// File path: assets/images/apex-logo.png
  AssetGenImage get apexLogo =>
      const AssetGenImage('assets/images/apex-logo.png');

  /// File path: assets/images/community-hero.png
  AssetGenImage get communityHero =>
      const AssetGenImage('assets/images/community-hero.png');

  /// File path: assets/images/elryad-logo.png
  AssetGenImage get elryadLogo =>
      const AssetGenImage('assets/images/elryad-logo.png');

  /// File path: assets/images/flutter bird.png
  AssetGenImage get flutterBird =>
      const AssetGenImage('assets/images/flutter bird.png');

  /// File path: assets/images/flutter-desk.png
  AssetGenImage get flutterDesk =>
      const AssetGenImage('assets/images/flutter-desk.png');

  /// File path: assets/images/gdsc-logo.png
  AssetGenImage get gdscLogo =>
      const AssetGenImage('assets/images/gdsc-logo.png');

  /// File path: assets/images/learn-hero.png
  AssetGenImage get learnHero =>
      const AssetGenImage('assets/images/learn-hero.png');

  /// File path: assets/images/magdsoft-logo.png
  AssetGenImage get magdsoftLogo =>
      const AssetGenImage('assets/images/magdsoft-logo.png');

  /// File path: assets/images/my-photo.png
  AssetGenImage get myPhoto =>
      const AssetGenImage('assets/images/my-photo.png');

  /// File path: assets/images/neop-logo.png
  AssetGenImage get neopLogo =>
      const AssetGenImage('assets/images/neop-logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    accuraLogo,
    apexLogo,
    communityHero,
    elryadLogo,
    flutterBird,
    flutterDesk,
    gdscLogo,
    learnHero,
    magdsoftLogo,
    myPhoto,
    neopLogo,
  ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/achivements.json
  LottieGenImage get achivements =>
      const LottieGenImage('assets/lottie/achivements.json');

  /// File path: assets/lottie/hand-wave.json
  LottieGenImage get handWave =>
      const LottieGenImage('assets/lottie/hand-wave.json');

  /// List of all assets
  List<LottieGenImage> get values => [achivements, handWave];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

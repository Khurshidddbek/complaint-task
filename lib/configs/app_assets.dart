class AppAssets {
  static AssetIcons icons = const AssetIcons();
  static SVGAssetIcons svgIcons = const SVGAssetIcons();
  // example: static BgImages bgImages = const BgImages();
}

class AssetIcons {
  const AssetIcons();
  String get checkSuccess => 'assets/icons/check-success.png';
  String get checkFail => 'assets/icons/check-fail.png';
}

class SVGAssetIcons {
  const SVGAssetIcons();
  String get icHome => 'assets/icons/ic-home.svg';
  String get icItems => 'assets/icons/ic-items.svg';
  String get icPlus => 'assets/icons/ic-plus.svg';
  String get icSearch => 'assets/icons/ic-search.svg';
  String get icProfile => 'assets/icons/ic-profile.svg';
}

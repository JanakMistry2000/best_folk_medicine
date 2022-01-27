import 'package:best_folk_medicine/colors.dart';
import 'package:flutter/cupertino.dart';

enum Flavor { DEV, LIVE }

class FlavorColor {
  Color primarycolor;
  Color primarylight;
  Color titlecolor;

  FlavorColor(
      {this.primarycolor = AppColor.black,
      this.primarylight = AppColor.grey,
      this.titlecolor = AppColor.black});
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorColor flavorColor;
  static FlavorConfig? _instance;
  GlobalKey appkey;

  factory FlavorConfig(
      {required Flavor flavor,
      required FlavorColor flavorColor,
      required GlobalKey globalKey}) {
    _instance ??= FlavorConfig._internal(flavor, flavorColor, globalKey);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.flavorColor, this.appkey);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isLive() => _instance!.flavor == Flavor.LIVE;

  static bool isDevelop() => _instance!.flavor == Flavor.DEV;
}

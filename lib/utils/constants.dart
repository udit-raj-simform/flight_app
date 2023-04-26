import 'package:flight_app/utils/exports.dart';
import 'package:flutter/cupertino.dart';

mixin Constants {
  static final MediaQueryData _mediaQueryData =
  MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  static final deviceHeight = _mediaQueryData.size.height;
  static final deviceWidth = _mediaQueryData.size.width;
  static final scaffoldHeight =
      deviceHeight - kToolbarHeight - kBottomNavigationBarHeight;

  static final orientation = _mediaQueryData.orientation;
  static final isPortrait = orientation == Orientation.portrait;

  static const paddingSym =
  EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0);
  static const marginSym =
  EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0);

  static const paddingAll = EdgeInsets.all(15.0);
  static const marginAll = EdgeInsets.all(15.0);

  static const IconData briefcase = IconData(0xf5a1,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);
  static const IconData arrowUpArrowDownCircleFill = IconData(0xf51f,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);

  static const List<IconData> tipsIcon = [
    Constants.briefcase,
    Icons.airplanemode_active_rounded,
    Constants.briefcase,
    Icons.airplanemode_active_rounded,
    Constants.briefcase,
    Icons.airplanemode_active_rounded,
    Constants.briefcase,
    Icons.airplanemode_active_rounded,
    Constants.briefcase,
    Icons.airplanemode_active_rounded,

  ];
}

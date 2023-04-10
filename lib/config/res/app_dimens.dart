import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimens {
  static const Size designSize = Size(360, 690);
  static const double buttonRadius = 6;

  static const double _buttonTextSize = 15;
  static const double _labelEditTextSize = 14;
  static const double _smallTextSize = 14;
  static const double _memoTextSize = 12;
  static const double _mediumTextSize = 16;
  static const double _largeTextSize = 20;
  static const double _headerTitleSize = 16;

  static const double _smallSpacingVer = 12;
  static const double _aBitSpacingVer = 6;
  static const double _aBitSpacingHor = 6;
  static const double _mediumSpacingVer = 24;
  static const double _smallSpacingHor = 12;
  static const double _mediumSpacingHor = 24;
  static const double _buttonHeight = 50;

  static const double _logoSize = 200;
  static const double _iconSmallSize = 24;
  static const double _iconMediumSize = 32;
  static const double _iconLargeSize = 42;
  static const double _headerTypeHeightRatio = 0.8;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightSemi = FontWeight.w500;
  static const double itemBorderSideWidth = 1;
  static const double gridFileHeight = kToolbarHeight * 3;
  static const double gridFileFooterHeight = kToolbarHeight * 0.8;
  static const FontWeight semiBold = FontWeight.w600;

  static double get labelEditTextSize => _labelEditTextSize.sp;

  static double get buttonTextSize => _buttonTextSize.sp;

  static double get memoTextSize => _memoTextSize.sp;

  static double get smallTextSize => _smallTextSize.sp;

  static double get mediumTextSize => _mediumTextSize.sp;

  static double get largeTextSize => _largeTextSize.sp;

  static double get headerTitleSize => _headerTitleSize.h;

  static double get logoSize => _logoSize.h;

  static double get iconLargeSize => _iconLargeSize.h;

  static double get iconMediumSize => _iconMediumSize.h;

  static double get iconSmallSize => _iconSmallSize.h;

  /// 6.w
  static double get aBitSpacingVer => _aBitSpacingVer.h;

  /// 6.w
  static double get aBitSpacingHor => _aBitSpacingHor.w;

  /// 12.w
  static double get smallSpacingVer => _smallSpacingVer.h;

  /// 24.w
  static double get mediumSpacingVer => _mediumSpacingVer.h;

  /// 12.w
  static double get smallSpacingHor => _smallSpacingHor.w;

  /// 24.w
  static double get mediumSpacingHor => _mediumSpacingHor.w;

  static double get buttonHeight => _buttonHeight;

  static double get headerTypeHeight =>
      (kToolbarHeight * _headerTypeHeightRatio).h;
}

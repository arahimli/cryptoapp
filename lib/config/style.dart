import 'dart:ui';

import 'package:cryptoapp/config/config.dart';
import 'package:flutter/material.dart';

class MainStyles {
  MainStyles._();

  ///
  /// Main Style
  ///
  static TextStyle mainAppbarStyle = TextStyle( fontFamily: MainConfig.main_default_font_family, fontSize: 28, height: 1.1, fontWeight: FontWeight.w800);
  static TextStyle appbarStyle = TextStyle( fontFamily: MainConfig.main_default_font_family, fontSize: 24, height: 1.1, fontWeight: FontWeight.w700);
  static TextStyle blackTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w900);
  static TextStyle extraBoldTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w800);
  static TextStyle boldTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w700);
  static TextStyle semiBoldTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w600);
  static TextStyle mediumTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w500);
  static TextStyle regularTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w400);
  static TextStyle lightTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w300);
  static TextStyle extraLightTextStyle = TextStyle( fontFamily: MainConfig.main_default_font_family,fontSize: 16, height: 1.1, fontWeight: FontWeight.w200);



  static void _loadDarkStyles() {
    ///
    /// Main Style
    ///
    mainAppbarStyle = mainAppbarStyle.copyWith(color: Colors.white);
    appbarStyle = appbarStyle.copyWith(color: Colors.white);
    boldTextStyle = boldTextStyle.copyWith(color: Colors.white);
    blackTextStyle = blackTextStyle.copyWith(color: Colors.white);
    extraBoldTextStyle = extraBoldTextStyle.copyWith(color: Colors.white);
    boldTextStyle = boldTextStyle.copyWith(color: Colors.white);
    semiBoldTextStyle = semiBoldTextStyle.copyWith(color: Colors.white);
    mediumTextStyle = mediumTextStyle.copyWith(color: Colors.white);
    regularTextStyle = regularTextStyle.copyWith(color: Colors.white);
    lightTextStyle = lightTextStyle.copyWith(color: Colors.white);
    extraLightTextStyle = extraLightTextStyle.copyWith(color: Colors.white);

  }

  static void _loadLightStyles() {
    ///
    /// Main Style
    ///
    mainAppbarStyle = mainAppbarStyle.copyWith(color: Colors.black);
    appbarStyle = appbarStyle.copyWith(color: Colors.black);
    boldTextStyle = boldTextStyle.copyWith(color: Colors.black);
    blackTextStyle = blackTextStyle.copyWith(color: Colors.black);
    extraBoldTextStyle = extraBoldTextStyle.copyWith(color: Colors.black);
    boldTextStyle = boldTextStyle.copyWith(color: Colors.black);
    semiBoldTextStyle = semiBoldTextStyle.copyWith(color: Colors.black);
    mediumTextStyle = mediumTextStyle.copyWith(color: Colors.black);
    regularTextStyle = regularTextStyle.copyWith(color: Colors.black);
    lightTextStyle = lightTextStyle.copyWith(color: Colors.black);
    extraLightTextStyle = extraLightTextStyle.copyWith(color: Colors.black);

  }





  static void loadStyle(bool isDarkMode) {
    if (isDarkMode) {
      _loadDarkStyles();
    } else {
      _loadLightStyles();
    }
  }


}
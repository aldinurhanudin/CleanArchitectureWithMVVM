import 'package:clean_architecture_mvvm/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,

    disabledColor: ColorManager.grey1,
    accentColor:  ColorManager.grey
    //card view theme

    //button theme

    //Text theme

    //input decoration theme(Text form)
  );
}

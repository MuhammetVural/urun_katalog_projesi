import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/gen/fonts.gen.dart';

import 'color_manager.dart';
import 'font_manager.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of the app

    primaryColor: ColorManager.white,
    primaryColorLight: ColorManager.textFieldGreyBackround,
    primaryColorDark: ColorManager.primaryDark,
    //ripple color
    splashColor: ColorManager.splash,
    disabledColor: ColorManager.grey1,
    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey1,
      
    ),

    // Appbar theme

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        titleTextStyle:const TextStyle(fontFamily: FontFamily.manrope, fontWeight: FontWeight.bold),),

    // Button theme

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.orangeButtonColor,
      
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontFamily: FontFamily.manrope),
        backgroundColor: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),

    // Text theme

    // textTheme: TextTheme(
    //   displayLarge: getSemiBoldStyle(
    //       color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //   titleMedium:
    //       getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    //   bodySmall: getRegularStyle(color: ColorManager.grey1),
    //   bodyLarge: getRegularStyle(color: ColorManager.grey),
    // ),

    //inputDecoration theme (text form field)

    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: EdgeInsets.all(AppPadding.p8),
    //   hintStyle: getRegularStyle(color: ColorManager.grey1),
    //   labelStyle: getMediumStyle(color: ColorManager.darkGrey),
    //   errorStyle: getRegularStyle(color: ColorManager.error),
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
    //     borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //     borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //     borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    //   ),
    // ),
  );
}

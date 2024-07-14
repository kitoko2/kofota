import 'package:flutter/material.dart';
import 'package:kofota/utils/constant.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    listTileTheme: const ListTileThemeData(
        textColor: Colors.black,
        style: ListTileStyle.drawer,
        iconColor: Colors.black),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    chipTheme: ChipThemeData(
      labelStyle:
          TextStyle(color: Colors.black, fontFamily: ConstantString.policeApp),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true, // this will remove the default content padding
      // now you can customize it here or add padding widget
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.grey.shade200,
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(
        fontFamily: ConstantString.policeApp,
        fontSize: 15,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: ConstantString.policeApp,
        fontSize: 15,
      ),
    ),
    dialogTheme: DialogTheme(
      surfaceTintColor: Colors.white,
      contentTextStyle: TextStyle(
        fontFamily: ConstantString.policeApp,
        fontSize: 20,
      ),
      titleTextStyle: TextStyle(
        fontFamily: ConstantString.policeApp,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
        TextStyle(
            fontFamily: ConstantString.policeApp, fontWeight: FontWeight.w500),
      )),
    ),
    cardTheme: const CardTheme(color: Colors.white),
    shadowColor: Colors.grey.withOpacity(0.1),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: ConstantString.policeApp,
        ),
      ),
    )),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: ConstantString.policeApp,
        color: Colors.black,
      ),
    ),
  );
}

import 'package:ecommerce/theme/app_color.dart';
import 'package:flutter/material.dart';

TextStyle anyStyleOne = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontFamily: 'Comfortaa',
);

TextStyle anyStyleThree(BuildContext context) => TextStyle(
      fontSize: 13 * MediaQuery.of(context).textScaleFactor,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      fontFamily: 'Comfortaa',
      overflow: TextOverflow.ellipsis,
    );
TextStyle accounttext(BuildContext context) => TextStyle(
      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: 'Comfortaa',
      overflow: TextOverflow.ellipsis,
    );

TextStyle anyStylefour = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontFamily: 'Comfortaa',
);
TextStyle btnstyle = const TextStyle(
    color: Colors.black,
    fontSize: 40.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Comfortaa',
    overflow: TextOverflow.ellipsis);
TextStyle silverhome = const TextStyle(
    color: Colors.black,
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    height: 1.5,
    fontFamily: 'Comfortaa',
    overflow: TextOverflow.ellipsis);
TextStyle dashContainer(BuildContext context) => TextStyle(
      color: Colors.black,
      fontSize: 15.0 * MediaQuery.of(context).textScaleFactor,
      fontWeight: FontWeight.w400,
      height: 1.0,
      fontFamily: 'Comfortaa',
      overflow: TextOverflow.ellipsis,
    );

TextStyle authButton = const TextStyle(
  color: AppColors.appBlack,
  fontSize: 25.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Comfortaa',
);
TextStyle popText = const TextStyle(
  color: AppColors.appBlack,
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'Comfortaa',
);

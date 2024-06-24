import 'package:flutter/material.dart';

const mBackgroundColor = Color(0xffEFF1FD);
const mWhiteColor = Colors.white;
const mBlackColor = Colors.black;
const mGreyColor = Colors.grey;
const mIconColor = mThemeColor;
const mFABColor = Color(0xffE7E7FF);
const mThemeColor = Colors.red;
const mBlueGreyColor = Colors.blueGrey;
const mChatIconColor = Colors.grey;
const mTransparent = Colors.transparent;
const mTaskHistoryBG = Color(0xffffcccb);
const mProfileBorderColor = Color(0xffFFA07A);
const mNewTaskColor = Colors.indigo;
const mInProgressColor = Colors.blue;
const mCompletedColor = Colors.green;
const mInCompletedColor = Colors.red;
const mEmpWiseTaskColor = Colors.pink;
const mEmp1stColor = Color(0xff05634B);
const mEmp2ndColor = Color(0xff19B373);
const mDes1stColor = Color(0xff263066);
const mDes2ndColor = Color(0xff4C8DE9);
const mTask1stColor = Color(0xff24398C);
const mTask2ndColor = Color(0xffA82793);
const mReport1stColor = Color(0xffA34DA1);
const mReport2ndColor = Color(0xff1289C1);
const mRpt1stColor = Color(0xff09125F);
const mRpt2ndColor = Color(0xff7C0466);
const mlinkColor = Color(0xff0066F2);
const mtopIconColor = Color(0xffCECEFF);
const mPlaceholderColor = Color(0xff7C7C86);
const mGreyShadeColor = Color(0xffE8E8E8);

Color colorCurve = const Color.fromRGBO(97, 10, 165, 0.8);
Color colorCurveSecondary = const Color.fromRGBO(97, 10, 155, 0.6);
Color backgroundColor = Colors.grey.shade200;
Color textPrimaryColor = Colors.black87;

//textColors
Color textPrimaryLightColor = Colors.white;
Color textPrimaryDarkColor = Colors.black;
Color textSecondaryLightColor = Colors.black87;
Color textSecondary54 = Colors.black54;
Color textSecondaryDarkColor = Colors.blue;
Color hintTextColor = Colors.white30;
Color hintextColor = Colors.white24;
Color hintTextColoTr = Colors.white54;
Color bucketDialogueUserColor = Colors.red;
Color disabledTextColour = Colors.black54;
Color placeHolderColor = Colors.black26;
Color dividerColor = Colors.black26;
const mBGThemeColor = Color(0xfff2f2f7);
const mTileThemeColor = Color(0xffffffff);
const mThemeLightColor = Color(0xffFCDAD8);




TextStyle mEditProfileTextStyle = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  fontFamily: "Poppins",
);


TextStyle mEditProfileTTextStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  fontFamily: "Poppins",
);


TextStyle mViewEditTextStyle = const TextStyle(
  color: Colors.white ,
  fontWeight: FontWeight.w900,
  fontSize: 20,
  fontFamily: "Poppins",
);

TextStyle mViewEditText = const TextStyle(
  color: Colors.black ,
  fontWeight: FontWeight.w900,
  fontSize: 18,
  fontFamily: "Poppins",
);

TextStyle mViewEditTText = const TextStyle(
  color: Colors.white ,
  fontWeight: FontWeight.w900,
  fontSize: 18,
  fontFamily: "Poppins",
);


TextStyle mEditP = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 20,
  fontFamily: "Poppins",
);

TextStyle mEditR= const TextStyle(
  color: Colors.blue,
  fontWeight: FontWeight.w900,
  fontSize: 18,
  fontFamily:"Poppins",
);

TextStyle mEditQ= const TextStyle(
color: Colors.black,
fontWeight: FontWeight.w400,
fontSize: 18,
fontFamily: "Poppins",
);

TextStyle mEditPY = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    fontFamily: "Poppins",
);

TextStyle myEditUt = const TextStyle(
    fontSize: 30,
    color: mWhiteColor,
    fontWeight: FontWeight.bold,
    fontFamily: "Poppins",

);

final ThemeData myTheme = ThemeData(
  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 16.0, letterSpacing: 1,  fontFamily: "Poppins", color: Colors.white60),
    displayMedium: const TextStyle(fontSize: 16.0, letterSpacing: .5, fontWeight: FontWeight.w200, fontFamily: "Poppins", color: mlinkColor),
    displaySmall: TextStyle(fontSize: 16.0, letterSpacing: .7,fontWeight: FontWeight.normal, fontFamily: "Poppins", color: textPrimaryLightColor),
    headlineMedium: TextStyle(fontSize: 15.0, letterSpacing: 1,fontWeight: FontWeight.w400, fontFamily: "Poppins", color: textPrimaryColor),
    headlineSmall: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, fontFamily: "Poppins", color: textPrimaryDarkColor),
    titleLarge: const TextStyle(fontSize: 27, letterSpacing: .7, color: mWhiteColor, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
    titleMedium: const TextStyle(fontSize: 25, letterSpacing: .7, color: mWhiteColor, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
    titleSmall: const TextStyle(fontSize: 16, letterSpacing: .5, color: Colors.white, fontWeight: FontWeight.w200,fontFamily: "Poppins"),
    bodyLarge: TextStyle(fontSize: 18,letterSpacing: .5, color: textPrimaryLightColor, fontWeight: FontWeight.normal, fontFamily: "Poppins"),
    bodyMedium: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: "Poppins", color: textPrimaryDarkColor),
  )
);



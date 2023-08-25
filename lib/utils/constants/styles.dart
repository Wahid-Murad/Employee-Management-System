import 'package:employee_management/utils/constants/imports.dart';

dynamic screenWiseSize(size, difference) {
  return height > kSmallDeviceSizeLimit ? size : size - difference;
}

TextStyle h1TextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h36, 2), color: color);
}

TextStyle h2TextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h28, 2), color: color);
}

TextStyle h3TextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h24, 2), color: color);
}

TextStyle h4TextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h20, 2), color: color);
}

TextStyle titleTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w600, fontSize: screenWiseSize(h24, 2), color: color);
}

TextStyle subTitleTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w600, fontSize: screenWiseSize(h20, 2), color: color);
}

TextStyle bodyTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w400, fontSize: screenWiseSize(h16, 2), color: color);
}

TextStyle buttonTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w600, fontSize: screenWiseSize(h16, 2), color: color);
}

TextStyle smallBodyTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w400, fontSize: screenWiseSize(h14, 2), color: color);
}

TextStyle captionTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w400, fontSize: screenWiseSize(h12, 2), color: color);
}

TextStyle smallTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w400, fontSize: screenWiseSize(h10, 2), color: color);
}

TextStyle p18MediumTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h18, 2), color: color);
}

TextStyle p16MediumTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h16, 2), color: color);
}

TextStyle p16RegularTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w400, fontSize: screenWiseSize(h16, 2), color: color);
}

TextStyle p14MediumTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h14, 2), color: color);
}

TextStyle p14RegularTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w400, fontSize: screenWiseSize(h14, 2), color: color);
}

TextStyle p12MediumTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w500, fontSize: screenWiseSize(h12, 2), color: color);
}

TextStyle p12RegularTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w400, fontSize: screenWiseSize(h12, 2), color: color);
}

//* info: remove extra padding from TextButton
ButtonStyle? kTextButtonStyle = TextButton.styleFrom(
  padding: EdgeInsets.zero,
  minimumSize: Size.zero,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  splashFactory: InkSplash.splashFactory,
);

//* info:: box border
BoxBorder? kMainBoxBorder = Border.all(color: cOutLineColor, width: 1);
BoxBorder? kThinOutlinedBoxBorder = Border.all(color: cOutLineColor, width: .5);
BoxBorder? kThinMainBoxBorder = Border.all(color: cTextPrimaryColor, width: .5);
BoxBorder? kPrimaryBoxBorder = Border.all(color: cPrimaryColor, width: 1);
BoxBorder? kWhiteBoxBorder = Border.all(color: cWhiteColor, width: 1);
BoxBorder? kRedAccentBoxBorder = Border.all(color: cRedAccentColor, width: 1);

ButtonStyle? kElevatedButtonStyle = ButtonStyle(
  alignment: Alignment.center,
  // textStyle: MaterialStateProperty.all(p16MediumTextStyle(cWhiteColor)),
  elevation: MaterialStateProperty.all(0),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(kButtonBorderRadius)),
  ),
  splashFactory: InkSplash.splashFactory,
  backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return cTextSecondaryColor;
    }
    return cPrimaryColor;
  }),
);

LinearGradient kPrimaryCircleGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0xFF3D5BF6).withOpacity(.15),
    const Color(0xFF3D5BF6).withOpacity(.05),
  ],
);

LinearGradient kRedCircleGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    cRedAccentColor.withOpacity(.15),
    cRedAccentColor.withOpacity(.05),
    // cRedAccentColor,
  ],
);

BorderRadius? topCircularBorder = const BorderRadius.only(topLeft: Radius.circular(k10BorderRadius), topRight: Radius.circular(k10BorderRadius));
const normalText = TextStyle();

//*Newly Added TextStyle
TextStyle p24RegularTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w700, fontSize: screenWiseSize(h24, 2), color: color);
}

TextStyle p20MediumTextStyle(Color color) {
  return TextStyle(fontFamily: ksOutFit, fontWeight: FontWeight.w700, fontSize: screenWiseSize(h20, 2), color: color);
}

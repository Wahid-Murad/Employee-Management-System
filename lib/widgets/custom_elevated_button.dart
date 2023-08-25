import 'package:employee_management/utils/constants/colors.dart';
import 'package:employee_management/utils/constants/const.dart';
import 'package:employee_management/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final GestureTapCallback? onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor, borderColor;
  final bool isButtonInPopUp, isCircularHead, autoFocus, isPadding;
  final IconData? labelIcon;
  final TextStyle? textStyle;

  const CustomElevatedButton(
      {Key? key,
      this.buttonColor = cPrimaryColor,
      this.borderColor,
      required this.label,
      required this.onPressed,
      this.buttonWidth,
      this.labelIcon,
      this.buttonHeight,
      this.isCircularHead = true,
      this.isButtonInPopUp = true,
      this.autoFocus = false,
      this.isPadding = false,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: isCircularHead ? BorderRadius.circular(kButtonBorderRadius) : BorderRadius.circular(k5BorderRadius),
              side: BorderSide(color: (buttonColor == cWhiteColor) ? (borderColor ?? cPrimaryColor) : cTransparentColor, width: 1),
            )),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return cIconColor.withOpacity(.5);
              }
              return buttonColor!;
            }),
            splashFactory: InkRipple.splashFactory,
          ),
          child: SizedBox(
            height: buttonHeight ?? (height > kSmallDeviceSizeLimit ? (kButtonHeight - 1) : (kButtonHeight - 6)),
            width: buttonWidth ?? width * .5,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: isPadding ? k5Padding : k0Padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return p16MediumTextStyle(cTextSecondaryColor);
                            }
                            return p16MediumTextStyle(cWhiteColor);
                          }),
                    ),
                    if (labelIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(left: k5Padding),
                        child: Icon(
                          labelIcon!,
                          color: cWhiteColor,
                          size: screenWiseSize(kIconSize18, 4),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

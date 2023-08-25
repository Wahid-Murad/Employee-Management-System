import 'package:employee_management/utils/constants/imports.dart';

class CustomRoundedCircleIconButton extends StatelessWidget {
  const CustomRoundedCircleIconButton({
    Key? key,
    required this.onPress,
    required this.icon,
    this.iconColor = cTextSecondaryColor,
    this.borderColor = cTextSecondaryColor,
    this.size,
    this.containerColor,
  }) : super(key: key);

  final Function()? onPress;
  final IconData? icon;
  final Color iconColor, borderColor;
  final double? size;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height > kSmallDeviceSizeLimit ? 40 : 35,
      width: height > kSmallDeviceSizeLimit ? 40 : 35,
      decoration: BoxDecoration(
          color: containerColor ?? cBackgroundNeutralColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
          )),
      child: ClipOval(
        child: TextButton(
          style: kTextButtonStyle,
          onPressed: onPress,
          child: Icon(
            icon,
            size: (size != null) ? size : null,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

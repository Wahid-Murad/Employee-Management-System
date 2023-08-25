import 'package:employee_management/utils/constants/imports.dart';
import 'package:employee_management/widgets/custom_rounded_circle_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.action,
    this.hasBackButton = true,
    required this.onBack,
    this.containerColor,
    this.iconColor,
    this.titleColor,
    this.appbarColor,
  }) : super(key: key);

  final dynamic title;
  final List<Widget>? action;
  final Function()? onBack;
  final bool hasBackButton;
  final Color? containerColor, iconColor;
  final Color? titleColor;
  final Color? appbarColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: kCommonElevation,
      backgroundColor: appbarColor ?? cTransparentColor,
      leadingWidth: kCommonBackSpace,
      titleSpacing: hasBackButton ? 0 : kHorizontalPadding,
      title: (title is String)
          ? Text(
              title,
              style: h3TextStyle(titleColor ?? cTextPrimaryColor),
            )
          : title,
      leading: hasBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: k15Padding),
              child: Row(
                children: [
                  CustomRoundedCircleIconButton(
                    borderColor: cOutLineColor,
                    containerColor: containerColor,
                    icon: Icons.arrow_back_ios,
                    // key: const Key('arrowLeftButtonKey'),
                    iconColor: iconColor ?? cTextPrimaryColor,
                    onPress: onBack,
                    size: height > kSmallDeviceSizeLimit ? kIconSize20 : kIconSize16,
                  ),
                ],
              ),
            )
          : null,
      actions: action,
    );
  }
}

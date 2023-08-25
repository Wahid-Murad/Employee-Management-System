import 'package:employee_management/utils/constants/imports.dart';


class CommonAlertDialog extends StatelessWidget {
  const CommonAlertDialog({
    this.title,
    required this.addContent,
    this.hasCloseBtn = false,
    this.hasDivider = true,
    this.isPadding,
    this.actions,
    this.onClose,
    Key? key,
  }) : super(key: key);

  final String? title;
  final Widget? addContent;
  final bool hasCloseBtn, hasDivider;
  final bool? isPadding;
  final List<Widget>? actions;
  final Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(k5BorderRadius),
      ),
      elevation: 0,
      titlePadding: EdgeInsets.zero,
      title: ClipRRect(
        borderRadius: BorderRadius.circular(k5BorderRadius),
        child: Column(
          children: [
            Container(
              color: cWhiteColor,
              height: kDialogTitleContainerHeight,
              width: width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (title != null)
                    Center(
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: p16MediumTextStyle(cTextPrimaryColor),
                      ),
                    ),
                  if (hasCloseBtn)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CustomIconButton(
                        hasBorder: false,
                        onPress: onClose,
                        icon: Icons.close,
                        size: height > kSmallDeviceSizeLimit ? kIconSize20 : kIconSize16,
                      ),
                    ),
                ],
              ),
            ),
            const CustomDivider(
              height: 0.5,
              thickness: 0.3,
              color: cOutLineColor,
            )
          ],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: isPadding == null ? k15Padding : k0Padding,
        vertical: isPadding == null ? k10Padding : k0Padding,
      ),
      insetPadding: const EdgeInsets.all(k20Padding),
      content: addContent,
      actions: actions,
    );
  }
}

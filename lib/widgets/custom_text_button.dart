import 'package:employee_management/utils/constants/imports.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    required this.textStyle,
    this.isIconExits,
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final TextStyle textStyle;
  final bool? isIconExits;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle,
            ),
            if (isIconExits != null) kW5sizedBox,
            if (isIconExits != null)
              const Icon(
                Icons.arrow_forward,
                size: 18,
                color: cWhiteColor,
              )
          ],
        ),
      ),
    );
  }
}


import 'package:employee_management/utils/constants/imports.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.height = 1,
    this.thickness = 1,
    this.color = cOutLineColor,
  }) : super(key: key);

  final double thickness, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: 0,
      endIndent: 0,
      color: color,
    );
  }
}

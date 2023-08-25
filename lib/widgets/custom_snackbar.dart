
import 'package:employee_management/utils/constants/imports.dart';

class CustomSnackBar extends StatefulWidget {
  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
  CustomSnackBar({
    Key? key,
    required this.description,
    this.title,
    this.width = 350,
    this.height = 56,
    this.duration = 1500,
    this.animationCurve = Curves.ease,
    this.onClose,
    required this.snackBarType,
  }) : super(key: key) {
    icon = snackBarIcons[snackBarType]!;
    color = snackBarColors[snackBarType]!;
    background = snackBarBackgroundColors[snackBarType]!;
  }

  final String description;
  final String? title;
  late final SnackBarType snackBarType;
  late final IconData icon;
  late final Color color, background;
  final double width, height;
  final int duration;
  final Curve animationCurve;
  final Function? onClose;
  void show(context) {
    showModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.white.withOpacity(0),
      barrierColor: Colors.transparent,
      context: context,
      builder: (_) => this,
    );
  }
}

class _CustomSnackBarState extends State<CustomSnackBar> with TickerProviderStateMixin {
  late CurvedAnimation curveAnimation;
  late AnimationController slideController;
  late Timer timer;
  void _initializeAnimation() {
    slideController = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    curveAnimation = CurvedAnimation(
      parent: slideController,
      curve: widget.animationCurve,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => slideController.forward(),
    );
  }

  @override
  void initState() {
    _initializeAnimation();
    timer = Timer(
      Duration(milliseconds: widget.duration * 2),
      () {
        slideController.forward();
        Navigator.of(context).pop();
        timer.cancel();
        widget.onClose?.call();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    slideController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -0.3), end: const Offset(0, 0)).animate(curveAnimation),
          child: Container(
            decoration: BoxDecoration(
              color: widget.background,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 8,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(k5BorderRadius),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Icon(widget.icon, color: widget.color, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (widget.title != null)
                          Text(
                            widget.title!,
                            style: buttonTextStyle(widget.color),
                          ),
                        Text(
                          widget.description,
                          style: p14RegularTextStyle(widget.color),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 5, top: 5),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    clipBehavior: Clip.hardEdge,
                    onPressed: () {
                      slideController.forward();
                      Navigator.of(context).pop();
                      timer.cancel();
                    },
                    child: const CircleAvatar(
                      radius: 7,
                      backgroundColor: cWhiteColor,
                      child: Icon(Icons.close, color: Color(0xFF4F4F4F), size: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const snackBarColors = {
  SnackBarType.success: cWhiteColor,
  SnackBarType.error: cWhiteColor,
  SnackBarType.warning: cWhiteColor,
  SnackBarType.info: cWhiteColor,
  SnackBarType.delete: cWhiteColor,
  SnackBarType.message: cWhiteColor
};

Map snackBarBackgroundColors = {
  SnackBarType.success: cSuccessColor.withOpacity(1),
  SnackBarType.error: cRedAccentColor.withOpacity(1),
  SnackBarType.warning: cWarningColor.withOpacity(1),
  SnackBarType.info: cInfoColor.withOpacity(1),
  SnackBarType.delete: cPrimaryColor.withOpacity(1),
  SnackBarType.message: cMessageColor.withOpacity(1)
};

const snackBarIcons = {
  SnackBarType.success: Icons.check_circle,
  SnackBarType.error: Icons.close,
  SnackBarType.warning: Icons.warning,
  SnackBarType.info: Icons.info,
  SnackBarType.delete: Icons.delete,
  SnackBarType.message: Icons.message,
};

enum SnackBarType { success, error, warning, info, delete, message }

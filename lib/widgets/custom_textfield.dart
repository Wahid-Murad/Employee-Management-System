import 'package:employee_management/utils/constants/imports.dart';

class CustomModifiedTextField extends StatelessWidget {
  final String? label, hint;
  final bool autoFocus, isSmall, obscureText, readOnly;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final ValueChanged<String>? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength, maxLines, minLines;
  final Function(String)? onChanged;
  final Widget? counter;
  final FocusNode? focusNode;
  final Function()? onSuffixPress;
  final IconData? prefixIcon, suffixIcon;
  final Color? fillColor;

  const CustomModifiedTextField({
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPress,
    this.counter,
    this.autoFocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.focusNode,
    this.isSmall = false,
    this.maxLength = k1LineInputLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters = const [],
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.onSubmit,
    this.onChanged,
    Key? key,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputStyle = p14MediumTextStyle(cTextPrimaryColor);
    var hintStyle = p14MediumTextStyle(cWhiteColor);
    return Theme(
      data: ThemeData(inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused) || controller.text.isNotEmpty) {
            return cTextPrimaryColor;
          }
          return cIconColor;
        }),
      )),
      child: TextFormField(
        obscureText: obscureText,
        textAlign: TextAlign.start,
        textCapitalization: TextCapitalization.sentences,
        style: inputStyle,
        readOnly: readOnly,
        focusNode: focusNode,
        autofocus: autoFocus,
        maxLength: maxLength,
        maxLines: maxLines,
        controller: controller,
        cursorColor: cTextPrimaryColor,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          prefixIcon: prefixIcon != null
              ? Transform.scale(
                  scale: .85,
                  child: Icon(prefixIcon),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(),
          suffixIcon: suffixIcon != null
              ? Transform.scale(
                  scale: .85,
                  child: CustomIconButton(
                    onPress: onSuffixPress,
                    icon: suffixIcon,
                    hasBorder: false,
                  ),
                )
              : null,
          fillColor: cLiteGreyColor,
          alignLabelWithHint: true, // This is necessary if the maxLines is greater than line 1.
          labelText: label,
          hintText: hint,
          // labelStyle: hintStyle,
          hintStyle: hintStyle,
          counter: (isSmall || counter == null) ? const SizedBox.shrink() : counter,
          contentPadding: const EdgeInsets.symmetric(horizontal: k15Padding, vertical: k10Padding),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: isSmall ? BorderRadius.circular(kOvalBorderRadius) : BorderRadius.circular(k15BorderRadius),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
        autocorrect: false,
        keyboardType: inputType,
        textInputAction: inputAction,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
      ),
    );
  }
}

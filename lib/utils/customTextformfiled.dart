import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.label,
    this.maxLength = 18,
    this.readOnly = false,
    this.isObscureText = false,
    this.isCollapsed = false,
    this.validator,
    this.prefixText,
    this.onTapAction,
    this.inputFormator,
    this.trailing,
    this.padding,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.shape,
    this.hint,
    this.isPrefix,
    this.isMaxLength,
    this.textInputAction,
    this.maxLines,
    this.isSuffix,
    this.ontap,
    this.focusNode,
    this.focusNodes,
  }) : super(key: key);

  final TextEditingController controller;
  final InputBorder? shape;
  final TextInputType? inputType;
  final String? label, prefixText;
  final bool readOnly, isObscureText, isCollapsed;
  final Widget? trailing;
  final int? maxLength;
  final EdgeInsets? padding;
  final List<TextInputFormatter>? inputFormator;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onTapAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? focusNodes;
  final TextInputAction? textInputAction;
  final String? hint;
  final bool? isPrefix, isMaxLength, maxLines, isSuffix;
  final Function? ontap;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: focusNodes,
      focusNode: focusNode,
      maxLines: maxLines == true ? 7 : 1,
      controller: controller,
      maxLength: isMaxLength == true ? 10 : null,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        counterText: "",
        labelText: label,
        suffixIcon: isSuffix == true
            ? IconButton(
                onPressed: () {
                  ontap!();
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: AppColor.greyColor,
                ))
            : null,
        prefixIcon: isPrefix == true
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getVerticalSize(10),
                    horizontal: getHorizontalSize(10)),
                child: const AppText(
                  text: "+91",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              )
            : null,
        labelStyle: const TextStyle(color: AppColor.blackColor),
        helperStyle: const TextStyle(color: AppColor.blackColor),
        errorStyle: const TextStyle(color: Colors.red),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColor.blackColor, fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColor.blackColor, width: .4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColor.blackColor, width: .4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: .4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.black, width: .4),
        ),
      ),
    );
  }
}

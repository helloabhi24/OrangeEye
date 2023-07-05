import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

import 'appText.dart';

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
    this.onChanged,
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
    this.length,
    this.isObscurring,
    this.suffixIcon,
    this.contentPadding,
    this.keys,
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
  final String? Function(String?)? onChanged;
  final String? Function(String?)? focusNodes;
  final TextInputAction? textInputAction;
  final String? hint;
  final bool? isPrefix, isMaxLength, maxLines, isSuffix, isObscurring;
  final Function? ontap;
  final FocusNode? focusNode;
  final int? length;
  final IconData? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Key? keys;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormator,
      enableSuggestions: true,
      readOnly: readOnly,
      autovalidateMode: autovalidateMode,
      key: keys,
      onChanged: onChanged,
      obscureText: isObscureText, obscuringCharacter: "*",
      onFieldSubmitted: focusNodes,
      focusNode: focusNode,
      maxLines: maxLines == true ? 7 : 1,
      controller: controller,
      maxLength: isMaxLength == true ? length : null,
      // onChanged: (v) {
      //   if (v.contains(RegExp(r'[1-10]'))) {
      //     return null;
      //   } else
      //     "enter valid mobile number";
      // },
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        counterText: "",
        labelText: label,
        suffixIcon: isSuffix == true
            ? IconButton(
                onPressed: () {
                  ontap!();
                },
                icon: Icon(
                  suffixIcon,
                  color: AppColor.greyColor,
                ))
            : null,
        prefixIcon: isPrefix == true
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getVerticalSize(14),
                    horizontal: getHorizontalSize(10)),
                child: AppText(
                  text: "+91",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            : null,
        labelStyle: TextStyle(color: AppColor.blackColor),
        helperStyle: TextStyle(color: AppColor.blackColor),
        errorStyle: const TextStyle(color: Colors.red),
        hintText: hint,
        hintStyle: TextStyle(color: AppColor.blackColor, fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColor.blackColor, width: .4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColor.blackColor, width: .4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Colors.red, width: .4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColor.blackColor, width: .4),
        ),
      ),
    );
  }
}

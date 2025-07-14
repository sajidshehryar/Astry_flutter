import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class SquareRoundedContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final int? maxInput;
  final bool isAplhabetAllowOnly;
  final Color borderColor;
  final Color? backgroundColor;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FormFieldValidator<String>? validator;

  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;

  const SquareRoundedContainer(
      {
    super.key,
    this.height = 48,
    this.width,
    this.borderColor = const Color(0xFFCCCCCC),
    this.backgroundColor,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.isAplhabetAllowOnly = false,
    this.hintStyle,
    this.textStyle,
    this.focusNode,
    this.validator,
    this.nextFocusNode,
    this.textInputAction, this.maxInput, required this.readOnly, this.onTap ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          inputFormatters:isAplhabetAllowOnly?
          maxInput != null ? [LengthLimitingTextInputFormatter(maxInput), FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),] : null: maxInput != null ? [LengthLimitingTextInputFormatter(maxInput),] : null,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textInputAction: textInputAction ?? TextInputAction.next,
          readOnly: readOnly,
          onTap: onTap,
          onFieldSubmitted: (_) {
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          style: textStyle ?? const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:borderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:Colors.redAccent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:borderColor),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SquareTextfieldContainer extends StatefulWidget {
  final double? height;
  final double? width;
  final int? maxInput;
  final bool isAplhabetAllowOnly;
  final String initialText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;

  const SquareTextfieldContainer({
    super.key,
    this.height = 50,
    this.width,
    required this.initialText,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.isAplhabetAllowOnly = false,
    this.textStyle,
    this.textInputAction,
    this.maxInput,
    required this.readOnly,
    this.onTap,
  });

  @override
  State<SquareTextfieldContainer> createState() => _SquareTextfieldContainerState();
}

class _SquareTextfieldContainerState extends State<SquareTextfieldContainer> {
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });

    if (widget.controller.text.isEmpty) {
      widget.controller.text = widget.initialText;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height! + 15,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Shadow
          Positioned(
            bottom: 4,
            left: 2,
            right: 2,
            child: Container(
              height: widget.height! * 0.60,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),

          // Gradient Border Container (on focus)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: isFocused
                    ? const LinearGradient(
                  colors: [
                    Color(0xFFA24BFF),
                    Color(0xFF7FAEE8),
                  ],
                )
                    : null,
              ),
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(1.5),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF320F6A),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  inputFormatters: widget.isAplhabetAllowOnly
                      ? [
                    if (widget.maxInput != null)
                      LengthLimitingTextInputFormatter(widget.maxInput),
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                  ]
                      : widget.maxInput != null
                      ? [LengthLimitingTextInputFormatter(widget.maxInput)]
                      : null,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText,
                  textInputAction: widget.textInputAction ?? TextInputAction.next,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,
                  style: widget.textStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

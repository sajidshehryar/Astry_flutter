import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/app_strings.dart';
class GradientPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String number, String countryCode) onChanged;
  final String initialCountryCode;
  final String initialPhoneNumber;
  final bool hasError;

  const GradientPhoneField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.initialCountryCode = 'IN',
    this.initialPhoneNumber='',
    this.hasError = false,
  });

  @override
  State<GradientPhoneField> createState() => _GradientPhoneFieldState();
}

class _GradientPhoneFieldState extends State<GradientPhoneField> {
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() => isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Shadow Layer
          Positioned(
            bottom: 0,
            left: 2,
            right: 2,
            child: Container(
              height: 40,
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
          // Main Gradient Border Container
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: isFocused
                  ? const LinearGradient(
                colors: [
                  Color(0xFFA24BFF),
                  Color(0xFF7FAEE8),
                ],
              ) : null,
            ),
            child: Container(
              margin: const EdgeInsets.all(1.5),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF320F6A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 6),
                child:IntlPhoneField(
                  focusNode: _focusNode,
                  controller: widget.controller,
                  initialCountryCode: widget.initialCountryCode,
                  initialValue: widget.initialPhoneNumber,
                  keyboardType: TextInputType.number,
                  disableLengthCheck: true,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  dropdownTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
                  flagsButtonPadding: const EdgeInsets.only(left: 8, right: 4),
                  dropdownIconPosition: IconPosition.trailing,
                  showCursor: true,
                  showDropdownIcon: true,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                    border: InputBorder.none,
                    hintText: AppString.mobileNoHint,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
                  ),
                  onChanged: (phone) {
                    widget.onChanged(phone.number, phone.countryCode);
                  },
                ),


              ),
            ),
          ),
        ],
      ),
    );
  }
}

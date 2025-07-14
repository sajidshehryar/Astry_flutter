import 'dart:io';

import 'package:astro_talk/animations/staggered_list_animation.dart';
import 'package:astro_talk/utils/common_widgets/gradient_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../bloc/signUp/signup_bloc.dart';
import '../../bloc/signUp/signup_event.dart';
import '../../bloc/signUp/signup_state.dart';
import '../../utils/utils.dart';
import '../../utils/common_widgets/gradient_rounded_button.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_strings.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key, required this.role});
  final String role;
  final selectedDOB = DateTime.now();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  String? selectedGender;
  String? selectedCountryCode = '+91';
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDOB,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (picked != null) {
      dobController.text =
      "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
    }
  }

  void _submit(BuildContext context) {

  }

  bool validateUserDetails(BuildContext context) {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final dob = dobController.text.trim();
    final time = timeController.text.trim();
    final mobile = mobileController.text.trim();
    final gender = selectedGender.toString();

    if (firstName.isEmpty) {
      Utils.showError(context, AppString.pleaseEnterFirstName);
      return false;
    } else if (lastName.isEmpty) {
      Utils.showError(context, AppString.pleaseEnterLastName);
      return false;
    } else if (dob.isEmpty) {
      Utils.showError(context, AppString.pleaseSelectDOB);
      return false;
    } else if (time.isEmpty) {
      Utils.showError(context, AppString.pleaseSelectTime);
      return false;
    }
    else if (gender == "null" || gender == ""){
      Utils.showError(context, AppString.pleaseSelectGender);
      return false;
    }
    else if (mobile.isEmpty) {
      Utils.showError(context, AppString.pleaseEnterMobileNo);
      return false;
    } else if (mobile.length < 10 || !RegExp(r'^\d{10,12}$').hasMatch(mobile)) {
      Utils.showError(context, AppString.pleaseEnterValidMobile);
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: searchColor,
        body: SafeArea(
          child: BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              var bloc = context.read<SignupBloc>();

              return SingleChildScrollView(
                physics:  ClampingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.loginTwo,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ).animate().fadeIn(
                      delay: 0.5.seconds,
                      duration: 500.ms,
                      curve: Curves.easeIn,
                    ),
                    Form(
                      key: formKey1,
                      child: Padding(
                        padding: EdgeInsets.only(top: Platform.isIOS ? 350 : 310),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                          child: Column(
                            children: [
                              StaggeredListAnimation(
                                initialDelay: 50,
                                interval: 50,
                                children: [
                                  wrapChildren(children: [
                                    Center(
                                      child: Text(
                                        AppString.enterYourDetails,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [

                                              RichText(
                                                text: const TextSpan(
                                                  text: AppString.firstName,
                                                  style: TextStyle(color: greyText, fontFamily: 'Poppins'),
                                                  children: [
                                                    TextSpan(
                                                      text: ' *',
                                                      style: TextStyle(color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Column(
                                                children: [
                                                  _buildInputField(
                                                    label: AppString.firstName,
                                                    maxInput: 20,
                                                    controller: firstNameController, isAplhabetAllowOnly: true,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                             RichText(
                                               text: const TextSpan(
                                                 text: AppString.lastName,
                                                 style: TextStyle(color: greyText, fontFamily: 'Poppins'),
                                                 children: [
                                                   TextSpan(
                                                     text: ' *',
                                                     style: TextStyle(color: Colors.red),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             _buildInputField(
                                               label: AppString.lastName,
                                               isAplhabetAllowOnly: true,
                                               controller: lastNameController,
                                               maxInput: 20,
                                             ),
                                           ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  SizedBox(height: 10,),
                                  wrapChildren(children: [
                                    _buildDatePicker(context,),
                                    const SizedBox(height: 15),
                                    _buildTimePicker(context,),
                                  ]),
                                  const SizedBox(height: 15),
                                  wrapChildren(children: [
                                    RichText(
                                      text: TextSpan(
                                        text: AppString.selectGender,
                                        style: TextStyle(color: greyText, fontFamily: 'Poppins'),
                                        children: const [
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    BlocBuilder<SignupBloc, SignupState>(
                                      builder: (context, state) {
                                        return Wrap(
                                          spacing: 16,
                                          runSpacing: 8,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Radio<String>(
                                                  value: 'Male',
                                                  groupValue: state.gender,
                                                  onChanged: (value) {
                                                    context.read<SignupBloc>().add(
                                                      SelectGender(context: context, gender: value!),
                                                    );
                                                  },
                                                ),
                                                const Text('Male', style: TextStyle(color: Colors.white)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Radio<String>(
                                                  value: 'Female',
                                                  groupValue: state.gender,
                                                  onChanged: (value) {
                                                    context.read<SignupBloc>().add(
                                                      SelectGender(context: context, gender: value!),
                                                    );
                                                  },
                                                ),
                                                const Text('Female', style: TextStyle(color: Colors.white)),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        );
                                      },
                                    ),
                                  ]),
                                  const SizedBox(height: 10),

                                  wrapChildren(children: [
                                    RichText(
                                      text: TextSpan(
                                        text: AppString.mobileNo,
                                        style: TextStyle(color: greyText, fontFamily: 'Poppins'),
                                        children: const [
                                          TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    FormField<String>(
                                      validator: (_) {
                                        final mobile = mobileController.text.trim();
                                        if (mobile.isEmpty) {
                                          return AppString.pleaseEnterMobileNo;
                                        } else if (!RegExp(r'^\d{10,12}$').hasMatch(mobile)) {
                                          return AppString.pleaseEnterValidMobile;
                                        }
                                        return null;
                                      },
                                      builder: (field) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IntlPhoneField(
                                              controller: mobileController,
                                              flagsButtonPadding: const EdgeInsets.all(8),
                                              dropdownIconPosition: IconPosition.trailing,
                                              dropdownTextStyle: const TextStyle(color: Colors.white),
                                              style: const TextStyle(color: Colors.white),
                                              decoration: InputDecoration(
                                                labelText: AppString.mobileNoHint,
                                                labelStyle: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11,
                                                ),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color: field.hasError ? Colors.red : const Color(0xFF756DBB),
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color: field.hasError ? Colors.red : const Color(0xFF756DBB),
                                                    width: 1,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color: field.hasError ? Colors.red : const Color(0xFF756DBB),
                                                  ),
                                                ),
                                              ),
                                              initialCountryCode: 'IN',
                                              showCursor: true,
                                              showDropdownIcon: true,
                                              onChanged: (phone) {
                                                selectedCountryCode = phone.countryCode;
                                                field.didChange(phone.number); // Notify form of changes
                                              },
                                            ),
                                            if (field.hasError)
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8, top: 4),
                                                child: Text(
                                                  field.errorText!,
                                                  style: const TextStyle(color: Colors.red, fontSize: 12),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                  ]),
                                  bloc.state.isLoading
                                      ? GradientLoadingButton()
                                      : GradientRoundedButton(
                                    text: AppString.getOtp,
                                    onTap: () {
                                      selectedGender = state.gender;

                                      if (formKey1.currentState!.validate()) {
                                        var data = {
                                          'firstName': firstNameController.text.trim(),
                                          'lastName': lastNameController.text.trim(),
                                          'dob': dobController.text.trim(),
                                          'dobTime': timeController.text.trim(),
                                          'phone': mobileController.text.trim(),
                                          'role': role,
                                          'gender': selectedGender.toString(),
                                          'countryCode':selectedCountryCode.toString()
                                        };

                                        context.read<SignupBloc>().add(GetOtp(context: context, data: data));
                                      }
                                    },
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

        ),
      ),
    );
  }


  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    int? maxInput,
    required final bool   isAplhabetAllowOnly,
    bool isAllowAlphabetOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLength: maxInput,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      inputFormatters: [
        if (maxInput != null) LengthLimitingTextInputFormatter(maxInput),
        if (isAplhabetAllowOnly) FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
      ],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF756DBB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF756DBB), width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF756DBB)),
        ),
      ),

    validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter $label';
        }
        if (isAllowAlphabetOnly && !RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
          return 'Only alphabets allowed';
        }
        return null;
      },
    );
  }



  Widget _buildDatePicker(BuildContext context) {
    return FormField<String>(
      validator: (_) {
        if (dobController.text.trim().isEmpty) {
          return AppString.pleaseSelectDOB;
        }
        return null;
      },
      builder: (field) {
        final errorText = field.errorText;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: AppString.dob,
                style: TextStyle(color: greyText, fontFamily: 'Poppins'),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () async {
                await _pickDate(context);
                field.didChange(dobController.text); // 🔁 Trigger validation update
              },
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: errorText != null ? Colors.red : const Color(0xFF756DBB),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        dobController.text.isEmpty ? AppString.dobHint : dobController.text,
                        style: TextStyle(
                          color: dobController.text.isEmpty ? greyText : Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(
                  errorText,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return FormField<String>(
      validator: (_) {
        if (timeController.text.trim().isEmpty) {
          return AppString.pleaseSelectTime;
        }
        return null;
      },
      builder: (field) {
        final errorText = field.errorText;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: AppString.timeOfBirth,
                style: TextStyle(color: greyText, fontFamily: 'Poppins'),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () async {
                await _pickTime(context);
                field.didChange(timeController.text); // 🔁 Notify the FormField
              },
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: errorText != null ? Colors.red : const Color(0xFF756DBB),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.grey, size: 16),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        timeController.text.isEmpty ? AppString.timeOfWork : timeController.text,
                        style: TextStyle(
                          color: timeController.text.isEmpty ? greyText : Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(
                  errorText,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}

Widget wrapChildren({required List<Widget> children}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: children,
  );
}
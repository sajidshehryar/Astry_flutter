import 'package:astro_talk/bloc/profile/profile_bloc.dart';
import 'package:astro_talk/bloc/profile/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/profile/profile_event.dart';
import '../../../utils/common_widgets/gradient _form_filed_countrycode.dart';
import '../../../utils/common_widgets/gradient_rounded_button.dart';
import '../../../utils/common_widgets/inner_shadow.dart';
import '../../../utils/common_widgets/square_textfield_container.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/utils.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});
   final TextEditingController usernameController = TextEditingController();
   final TextEditingController mobileController = TextEditingController();
   final TextEditingController mobileControllers = TextEditingController();

   final TextEditingController dobController = TextEditingController();
   final TextEditingController timeOfBirthController = TextEditingController();
   final TextEditingController countryController = TextEditingController();
   final selectedDOB = DateTime.now();  String selectedCountryCode = "+91";





   @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
       context.read<ProfileBloc>().add(GetProfile(context: context));
     });
    return
         GestureDetector(
           onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: searchColor,
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.backgroundGradient,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        context.pop();
                      },
                        child: Image.asset(AppAssets.circularPurpleBack,width: 40,height: 40,)),
                    const Text(
                      AppString.editProfile,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                   SizedBox(width: 20,)
                  ],
                ),
              ),
            ),
            body: SafeArea(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state.userModel == null) {
                        return const Center(child: CircularProgressIndicator());
                      }else{

                        return  SingleChildScrollView(
                             physics: ClampingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Utils.showImageSourceDialog(context);
                                          },
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: InnerShadowCircle(
                                              size: 94,
                                              child: Opacity(
                                                opacity: 0.26,
                                                child: state.selectedImage != null
                                                    ? ClipOval(
                                                  child: Image.file(
                                                    state.selectedImage!,
                                                    width: 150,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                                    : Image.network(
                                                  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                                                  width: 150,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          AppAssets.cameraLogo,
                                          width: 30,
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom:5),
                                    child: Text(AppString.yourName,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:'Poppins',
                                        color: profileTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:58,
                                    child:SquareTextfieldContainer(initialText:'${state.userModel?.firstName} ${state.userModel?.lastName}',
                                      controller: usernameController,
                                      maxInput: 50,
                                      isAplhabetAllowOnly: true,
                                      readOnly: false,),),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(AppString.yourMobile,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:'Poppins',
                                        color: profileTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  wrapChildren( children:[
                                    FormField<String>(
                                      validator: (_) {
                                        final mobile = mobileControllers.text.trim();
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
                                            GradientPhoneField(
                                              initialCountryCode:'${state.userModel?.countryCode}',
                                              initialPhoneNumber: '${state.userModel?.phone}',
                                              controller: mobileControllers,
                                              onChanged: (number, code) {
                                                selectedCountryCode = code;
                                                field.didChange(number);
                                              },
                                              hasError: field.hasError,
                                            )

                                          ],
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                  ]),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(AppString.dob,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:'Poppins',
                                        color: profileTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      await Future.delayed(const Duration(milliseconds: 100));
                                      await showAppDatePicker(context, dobController);
                                    },

                                    child: SizedBox(height:58,
                                      child:SquareTextfieldContainer(initialText:state.userModel!.dob ??'',
                                        controller: dobController,
                                        readOnly: true,),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(AppString.timeOfBirth,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:'Poppins',
                                        color: profileTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      FocusScope.of(context).unfocus();
                                      await Future.delayed(const Duration(milliseconds: 100));
                                      await showAppTimePicker(context, timeOfBirthController);
                                    },

                                    child: SizedBox(height:58,
                                      child:SquareTextfieldContainer(initialText:'${state.userModel?.dobTime}',
                                        controller: timeOfBirthController,
                                        readOnly: true,),),
                                  ),
                                  SizedBox(height: 10,),
                                  GradientRoundedButton(
                                      text: AppString.save,
                                      textStyle:TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700,fontFamily:'Poppins'),
                                      onTap: () {

                                      }),
                                  SizedBox(height: 10,),
                                ],
                              ),
                            )
                        );
                      }

                    }
                )
            ),
          ),
        ),
      ),
    );
  }

   Widget wrapChildren({required List<Widget> children}) {
     return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: children,
     );
   }

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
       timeOfBirthController.text = picked.format(context);
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

   Future<void> showAppDatePicker(BuildContext context, TextEditingController controller) async {
     final DateTime? picked = await showDatePicker(
       context: context,
       initialDate: DateTime.now().subtract(Duration(days: 365 * 20)),
       firstDate: DateTime(1900),
       lastDate: DateTime.now(),
       initialEntryMode: DatePickerEntryMode.calendarOnly,
       builder: (BuildContext context, Widget? child) {
         return Theme(
           data: ThemeData.dark().copyWith(
             primaryColor: Colors.deepPurple,
             hintColor: Colors.deepPurple,
             dialogBackgroundColor: Colors.deepPurple,
           ),
           child: child!,
         );
       },
     );

     if (picked != null) {
       controller.text = "${picked.day}/${picked.month}/${picked.year}";
     }
   }

   Future<void> showAppTimePicker(BuildContext context, TextEditingController controller) async {
     final TimeOfDay? picked = await showTimePicker(
       context: context,
       initialTime: TimeOfDay.now(),
       initialEntryMode: TimePickerEntryMode.dialOnly,

       builder: (BuildContext context, Widget? child) {
         return Theme(
           data: ThemeData.dark().copyWith(
             timePickerTheme: TimePickerThemeData(
               backgroundColor: Colors.deepPurple,
               dialHandColor: Colors.deepPurpleAccent,
             ),
           ),
           child: child!,
         );
       },
     );

     if (picked != null) {
       final now = DateTime.now();
       final dt = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
       controller.text = TimeOfDay.fromDateTime(dt).format(context);
     }
   }



   final  List<Map<String, dynamic>> items = [
    {
      'title': AppString.astrology,
      'icon': AppAssets.planetLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.numerology,
      'icon': AppAssets.numerologyLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.affirmation,
      'icon': AppAssets.affirmationLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.horoscope,
      'icon': AppAssets.horoscopeLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.love,
      'icon': AppAssets.loveLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
    {
      'title': AppString.dream,
      'icon': AppAssets.dreamLogo,
      'gradient': [radiantThree,radiantOne,showColor],
    },
  ];
}

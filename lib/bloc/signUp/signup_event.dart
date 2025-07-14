import 'package:flutter/cupertino.dart';

abstract class SignupEvent{
  const SignupEvent();
}

class VerifyOtp extends SignupEvent {
  final Map<String,dynamic> data;
  BuildContext context;
  VerifyOtp({required this.data,required this.context});

}

class GetOtp extends SignupEvent{
  final Map<String,dynamic> data;
  final  BuildContext context;
  GetOtp({required this.data,required this.context});

}

class ResendOtp extends SignupEvent{
  final Map<String,dynamic> data;
  final  BuildContext context;
  ResendOtp({required this.data,required this.context});

}

class CheckNumber extends SignupEvent{
  final Map<String,dynamic> data;
  final  BuildContext context;
  CheckNumber({required this.data,required this.context});

}
class SelectGender extends SignupEvent{
  final String gender;
  final  BuildContext context;
  SelectGender({required this.context,required this.gender});

}


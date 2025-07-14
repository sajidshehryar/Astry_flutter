
import 'dart:async';

import 'package:astro_talk/bloc/routes/app_pages.dart';
import 'package:astro_talk/bloc/signUp/signup_event.dart';
import 'package:astro_talk/bloc/signUp/signup_state.dart';
import 'package:astro_talk/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import '../../network/api_request.dart';
import '../../utils/get_storage.dart';
import '../../utils/utils.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  GetStorage getStorage = GetStorage();

  SignupBloc() : super(const SignupState()) {
    on<VerifyOtp>(_verifyOtp);
    on<GetOtp>(_getOTP);
    on<ResendOtp>(_resendOtp);
    on<CheckNumber>(_checkNumber);
    on<SelectGender>(_selectGender);

  }


  Future<void> _verifyOtp(
      VerifyOtp event,
      Emitter<SignupState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.post(
      apiEndpoint: ApiConstants.verifyOtp,
      context: event.context,
      body: event.data,
      onSuccess: (response) {
        if(response['token']!= null){
          SharedPreferenceHelper().saveUserToken(response['token']);
        }
        event.context.pushNamed(Routes.tourScreen);
        emit(state.copyWith(isLoading: false));
      },
      onError: (message) {
         emit(state.copyWith(isLoading: false));
         Utils.showError(event.context,message);
      },
    );
  }

  Future<void> _getOTP(
      GetOtp event,
      Emitter<SignupState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.post(
      apiEndpoint: ApiConstants.getOtp,
      context: event.context,
      body: event.data,
      onSuccess: (response) {
        print(response['otp']);
        emit(state.copyWith(isLoading: false));
        event.context.pushNamed(Routes.verification,extra: event.data);
        Utils.showError(event.context, 'Your OTP is send on mobile. please check');
      },
      onError: (message) {
        emit(state.copyWith(isLoading: false));
        Utils.showError(event.context,message);
      },
    );
  }

  Future<void> _resendOtp(
      ResendOtp event,
      Emitter<SignupState> emit,
      ) async {
    emit(state.copyWith(isLoadingResend: true));
    await ApiRequestType.post(
      apiEndpoint: ApiConstants.getOtp,
      context: event.context,
      body: event.data,
      onSuccess: (response) {
        emit(state.copyWith(isLoadingResend: false));
        Utils.showError(event.context, 'OTP resend on mobile. please check');
      },
      onError: (message) {
        emit(state.copyWith(isLoadingResend: false));
        Utils.showError(event.context,message);
      },
    );
  }

  Future<void> _checkNumber(
      CheckNumber event,
      Emitter<SignupState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.post(
      apiEndpoint: ApiConstants.checkNumber,
      context: event.context,
      body: event.data,
      onSuccess: (response) {
        emit(state.copyWith(isLoading: false));
        getStorage.write('isProfile', true);

        event.context.read<SignupBloc>().add(
          GetOtp(
              context: event.context,
              data: event.data
          ),
        );
      },
      onError: (message) {
        emit(state.copyWith(isLoading: false));
        Utils.showError(event.context,'User not found, Create an account');
      },
    );
  }





  FutureOr<void> _selectGender(SelectGender event, Emitter<SignupState> emit) {
    emit(state.copyWith(gender: event.gender));
  }
}

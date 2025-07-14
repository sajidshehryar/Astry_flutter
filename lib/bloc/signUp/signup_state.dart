
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final String? error;
  final bool isLoading;
  final bool isLoadingResend;
  final String gender;


  const SignupState({

    this.isLoading = false,
    this.isLoadingResend = false,
    this.gender='Male',
    this.error,
  });

  SignupState copyWith({
    String? gender,
    String? error,
    bool? isLoading,
    bool? isLoadingResend,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingResend: isLoadingResend ?? this.isLoadingResend,
      error: error,
      gender: gender??this.gender,
    );
  }

  @override
  List<Object?> get props => [error ?? '',isLoading,isLoadingResend,gender];
}

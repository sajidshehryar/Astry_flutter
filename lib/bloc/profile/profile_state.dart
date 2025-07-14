import 'dart:io';
import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class ProfileState extends Equatable {
  final bool isLoading;
  final String? error;
  final File? selectedImage;
  final UserModel? userModel;
  final File? profileImageFile;



  const ProfileState({
    this.isLoading = false,
    this.error,
    this.selectedImage,
    this.userModel,
    this.profileImageFile
  });

  ProfileState copyWith({
    bool? isLoading,
    String? error,
    File? selectedImage,
    UserModel? userModel,
    File? profileImageFile

  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedImage: selectedImage ?? this.selectedImage,
      userModel:userModel??this.userModel,
      profileImageFile: profileImageFile

    );
  }

  @override
  List<Object?> get props => [isLoading, error ?? '', selectedImage,userModel,profileImageFile];
}

import 'package:astro_talk/bloc/profile/profile_event.dart';
import 'package:astro_talk/bloc/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/user_model.dart';
import '../../network/api_constants.dart';
import '../../network/api_request.dart';
import '../../utils/get_storage.dart';
import '../../utils/utils.dart';
import '../home/home_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<UpdateProfileImage>(_updateProfileImage);
    on<GetProfile>(_getProfile);
    on<UpdateProfile>(_updateProfile);

  }

  void _updateProfileImage(UpdateProfileImage event, Emitter<ProfileState> emit) {
    emit(state.copyWith(selectedImage: event.image));
  }


  Future<void> _getProfile(GetProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.get(
      apiEndpoint: ApiConstants.getProfile,
      context: event.context,
      onSuccess: (response) {
        try {
          final user = UserModel.fromJson(response);
          emit(state.copyWith(userModel: user, isLoading: false));
        } catch (e) {
          print('UserModel parsing error: $e');
          emit(state.copyWith(error: 'Failed to parse user', isLoading: false));
        }
      },

      onError: (message) {
        Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false));
      },
    );
  }
  Future<void> _updateProfile(
      UpdateProfile event,
      Emitter<ProfileState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.put(
      apiEndpoint: ApiConstants.updateProfile,
      context: event.context,
      body: event.data,
      onSuccess: (response) {
        Utils.showError(event.context,'User Updated Successfully');
        add(GetProfile(context: event.context));
        emit(state.copyWith(isLoading: false));
      },
      onError: (message) {
        emit(state.copyWith(isLoading: false));
        Utils.showError(event.context,message);
      },
    );
  }


}

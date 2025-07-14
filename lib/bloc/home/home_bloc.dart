import 'package:astro_talk/data/models/astro_model.dart';
import 'package:astro_talk/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/compatibility_model.dart';
import '../../data/models/knowledge_model.dart';
import '../../data/models/user_profile.dart';
import '../../network/api_constants.dart';
import '../../network/api_request.dart';
import '../../utils/utils.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetAstrology>(_getAstrology);
    on<GetCompatibility>(_getCompatibility);
    on<GetKnowledge>(_getKnowledge);
    on<SelectSignupIndex>((event, emit) {
      if (state.selectedIndex == event.index) {
        emit(state.copyWith(selectedIndex: null));
      } else {
        emit(state.copyWith(selectedIndex: event.index));
      }
    });
  }

  Future<void> _getAstrology(GetAstrology event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.get(
      apiEndpoint: ApiConstants.getAstrology,
      context: event.context,
      onSuccess: (response) {
        var list = [];
        list.addAll(response);
         List<AstrologyMain> userChatList=[];
        for (var elem in list) {
          userChatList.add(AstrologyMain.fromJson(elem));
        }
        emit(state.copyWith(astrologyServices: userChatList, isLoading: false));
      },
      onError: (message) {
        Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> _getCompatibility(GetCompatibility event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.get(
      apiEndpoint: ApiConstants.getCompatibility,
      context: event.context,
      onSuccess: (response) {
        var listOne = [];
        var listTwo = [];

        if (response != null) {
          if (response['male'] != null) listOne.addAll(response['male']);
          if (response['female'] != null) listTwo.addAll(response['female']);
        }

        List<CompatibilityModel> compatibilityChatListMale = [];
        List<CompatibilityModel> compatibilityChatListFemale = [];

        for (var elem in listOne) {
          compatibilityChatListMale.add(CompatibilityModel.fromJson(elem));
        }
        for (var elem in listTwo) {
          compatibilityChatListFemale.add(CompatibilityModel.fromJson(elem));
        }
        emit(state.copyWith(compatibilityListMale:compatibilityChatListMale,compatibilityListFemale: compatibilityChatListFemale, isLoading: false));
      },
      onError: (message) {
        Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> _getKnowledge(GetKnowledge event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    await ApiRequestType.get(
      apiEndpoint: ApiConstants.getKnowledge,
      context: event.context,
      onSuccess: (response) {
        var list = [];
        list.addAll(response);
        List<KnowledgeModel> userChatList=[];
        for (var elem in list) {
          userChatList.add(KnowledgeModel.fromJson(elem));
        }
        emit(state.copyWith(knowledgeList: userChatList, isLoading: false));
      },
      onError: (message) {
        Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false));
      },
    );
  }




}

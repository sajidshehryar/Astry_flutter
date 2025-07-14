
import 'package:astro_talk/data/models/astro_model.dart';
import 'package:astro_talk/data/models/compatibility_model.dart';
import 'package:astro_talk/data/models/knowledge_model.dart';
import 'package:astro_talk/data/models/user_model.dart';
import 'package:astro_talk/data/models/user_profile.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String? error;
  final bool isLoading;
  final List<AstrologyMain> astrologyServices;
  final List<CompatibilityModel> compatibilityListMale;
  final List<CompatibilityModel> compatibilityListFemale;
  final List<KnowledgeModel> knowledgeList;
  final UserModel? userModel;
  final int? selectedIndex;




  const HomeState({

    this.isLoading = false,
    this.error,
    this.astrologyServices = const [],
    this.knowledgeList = const [],
    this.compatibilityListMale = const [],
    this.compatibilityListFemale = const [],
    this.userModel,
    this.selectedIndex


  });

  HomeState copyWith({

    String? error,
    bool? isLoading,
    bool? isLoadingResend,
    List<AstrologyMain>? astrologyServices,
    List<KnowledgeModel>? knowledgeList,
    List<CompatibilityModel>? compatibilityListMale, List<CompatibilityModel>? compatibilityListFemale,
    UserModel? userModel,
    int? selectedIndex,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      astrologyServices: astrologyServices??this.astrologyServices,
      knowledgeList: knowledgeList??this.knowledgeList,
      compatibilityListMale: compatibilityListMale??this.compatibilityListMale,
      compatibilityListFemale: compatibilityListFemale??this.compatibilityListFemale,
      userModel:userModel??this.userModel,
      selectedIndex: selectedIndex?? this.selectedIndex

    );
  }

  @override
  List<Object?> get props => [error ?? '',isLoading,astrologyServices,compatibilityListMale,compatibilityListFemale,knowledgeList,userModel,selectedIndex];
}

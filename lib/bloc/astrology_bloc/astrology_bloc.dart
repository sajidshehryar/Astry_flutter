import 'package:astro_talk/data/models/natal_model.dart';
import 'package:astro_talk/data/models/natal_wheel_model.dart';
import 'package:astro_talk/data/models/numero_report_model.dart';
import 'package:astro_talk/data/models/numerology_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/astrology_horoscope_model.dart';
import '../../network/api_constants.dart';
import '../../network/api_request.dart';
import '../../utils/utils.dart';
import 'astrology_event.dart';
import 'astrology_state.dart';

class AstrologyBloc extends Bloc<AstrologyEvent, AstrologyState> {
  AstrologyBloc() : super( AstrologyState()) {
    on<ChangeAstrologyTab>(_onTabChanged);
    on<GetHoroscopeDetails>(_getHoroscope);
    on<GetNatalData>(_getNatalData);
    on<GetNatalWheel>(_getNatalWheel);
    on<GetNumerologyData>(_getNumerology);
    on<GetNumerologyReport>(_getNumerologyReport);



  }

  void _onTabChanged(ChangeAstrologyTab event, Emitter<AstrologyState> emit) {
    emit(state.copyWith(selectedTabIndex: event.index, error: ''));
  }

  Future<void> _getHoroscope(GetHoroscopeDetails event, Emitter<AstrologyState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));

    await ApiRequestType.post(
      apiEndpoint: ApiConstants.getHoroscopeData,
      context: event.context,
      body: {},
      onSuccess: (response) {
        try {
          final horoscopeResponse = AstrologyPredictionData.fromJson(response);
          if(horoscopeResponse!=null){
            print(horoscopeResponse);
          }
          emit(state.copyWith(
            dailyPrediction: horoscopeResponse.today,
            tomorrowPrediction: horoscopeResponse.tomorrow,
            monthlyPrediction: horoscopeResponse.month,
            isLoading: false,
            error: '',
          )
          );
        } catch (e) {
          print('Parsing error: $e');
          emit(state.copyWith(
            error: 'Failed to parse horoscope data',
            isLoading: false,
          ));
        }
      },
      onError: (message) {
       // Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false, error: message));
      },
    );
  }

  Future<void> _getNatalData(GetNatalData event, Emitter<AstrologyState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));

    await ApiRequestType.post(
      apiEndpoint: ApiConstants.getNatalChart,
      context: event.context,
      body: {},
      onSuccess: (response) {
        try {
          emit(state.copyWith(
            astrologyChartData: AstrologyChartData.fromJson(response),
            isLoading: false,
            error: '',
          ));
        } catch (e) {
          emit(state.copyWith(
            error: 'Failed to parse natal chart',
            isLoading: false,
          ));
        }
      },
      onError: (message) {
       // Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false, error: message));
      },
    );
  }

  Future<void> _getNatalWheel(GetNatalWheel event, Emitter<AstrologyState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));

    await ApiRequestType.post(
      apiEndpoint: ApiConstants.getNatalChartImage,
      context: event.context,
      body: {},
      onSuccess: (response) {
        try {

          emit(state.copyWith(
          natalWheelData: NatalWheelData.fromJson(response),
            isLoading: false,
            error: '',
          )
          );
        } catch (e) {
          print('Parsing error: $e');
          emit(state.copyWith(
            error: 'Failed to parse horoscope data',
            isLoading: false,
          ));
        }
      },
      onError: (message) {
       // Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false, error: message));
      },
    );
  }


  Future<void> _getNumerology(GetNumerologyData event, Emitter<AstrologyState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));

    await ApiRequestType.post(
      apiEndpoint: ApiConstants.getNumerology,
      context: event.context,
      body: {},
      onSuccess: (response) {
        try {

          emit(state.copyWith(
            numerologyDetail: NumerologyDetail.fromJson(response),
            isLoading: false,
            error: '',
          )
          );
        } catch (e) {
          print('Parsing error: $e');
          emit(state.copyWith(
            error: 'Failed to parse horoscope data',
            isLoading: false,
          ));
        }
      },
      onError: (message) {
       // Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false, error: message));
      },
    );
  }

  Future<void> _getNumerologyReport(GetNumerologyReport event, Emitter<AstrologyState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));

    await ApiRequestType.post(
      apiEndpoint: ApiConstants.getNumerologyReport,
      context: event.context,
      body: {},
      onSuccess: (response) {
        try {

          emit(state.copyWith(
            numerologyReportModel: NumerologyReportModel.fromJson(response),
            isLoading: false,
            error: '',
          )
          );
        } catch (e) {
          print('Parsing error: $e');
          emit(state.copyWith(
            error: 'Failed to parse horoscope data',
            isLoading: false,
          ));
        }
      },
      onError: (message) {
     //   Utils.showError(event.context, message);
        emit(state.copyWith(isLoading: false, error: message));
      },
    );
  }



}

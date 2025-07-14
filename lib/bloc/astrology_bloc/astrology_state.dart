import 'package:astro_talk/data/models/numerology_model.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/astrology_horoscope_model.dart';
import '../../data/models/natal_model.dart';
import '../../data/models/natal_wheel_model.dart';
import '../../data/models/numero_report_model.dart';

class AstrologyState extends Equatable {
  final String? error;
  final bool isLoading;
  final int selectedTabIndex;

  final DailyPrediction? dailyPrediction;
  final DailyPrediction? tomorrowPrediction;
  final MonthlyPrediction? monthlyPrediction;
  final NatalChartResponse? natalChartResponse;
  final NatalWheelResponse? natalWheelResponse;
  final AstrologyChartData? astrologyChartData;
  final AstrologyPredictionData ? astrologyPredictionData;
  final NatalWheelData? natalWheelData;
  final NumerologyDetail? numerologyDetail;
  final NumerologyReportModel? numerologyReportModel;

  const AstrologyState({
    this.error,
    this.isLoading = false,
    this.selectedTabIndex = 0,
    this.dailyPrediction,
    this.tomorrowPrediction,
    this.monthlyPrediction,
    this.natalChartResponse,
    this.natalWheelResponse,
    this.astrologyChartData,
    this.natalWheelData,
    this.astrologyPredictionData,
    this.numerologyDetail,
    this.numerologyReportModel
  });

  AstrologyState copyWith({
    String? error,
    bool? isLoading,
    int? selectedTabIndex,
    DailyPrediction? dailyPrediction,
    DailyPrediction? tomorrowPrediction,
    MonthlyPrediction? monthlyPrediction,
    AstrologyChartData? astrologyChartData,
    NatalWheelData? natalWheelData,
    AstrologyPredictionData? astrologyPredictionData,
    NumerologyDetail? numerologyDetail,
    NumerologyReportModel? numerologyReportModel
  }) {
    return AstrologyState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      dailyPrediction: dailyPrediction ?? this.dailyPrediction,
      tomorrowPrediction: tomorrowPrediction ?? this.tomorrowPrediction,
      monthlyPrediction: monthlyPrediction ?? this.monthlyPrediction,
      natalChartResponse: natalChartResponse?? this.natalChartResponse,
      natalWheelResponse: natalWheelResponse?? this.natalWheelResponse,
      astrologyChartData: astrologyChartData?? this.astrologyChartData,
      astrologyPredictionData: astrologyPredictionData?? this.astrologyPredictionData,
      natalWheelData:  natalWheelData?? this.natalWheelData,
      numerologyDetail: numerologyDetail?? this.numerologyDetail,
        numerologyReportModel: numerologyReportModel?? this.numerologyReportModel
    );
  }

  @override
  List<Object?> get props => [
    error,
    isLoading,
    selectedTabIndex,
    dailyPrediction,
    tomorrowPrediction,
    monthlyPrediction,
    astrologyChartData,
    natalWheelData,
    astrologyPredictionData,
    numerologyDetail,
    numerologyReportModel
  ];
}

class AstrologyPredictionData {
  final DailyPrediction today;
  final DailyPrediction tomorrow;
  final MonthlyPrediction month;

  AstrologyPredictionData({
    required this.today,
    required this.tomorrow,
     required this.month,
  });

  factory AstrologyPredictionData.fromJson(Map<String, dynamic> json) {
    return AstrologyPredictionData(
      today: DailyPrediction.fromJson(json['today']),
      tomorrow: DailyPrediction.fromJson(json['tomorrow'] ?? {}),
      month: MonthlyPrediction.fromJson(json['month'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'today': today.toJson(),
    'tomorrow': tomorrow.toJson(),
     'month': month.toJson(),
  };
}

class DailyPrediction {
  final bool status;
  final String sunSign;
  final String predictionDate;
  final DailyPredictionDetail prediction;

  DailyPrediction({
    required this.status,
    required this.sunSign,
    required this.predictionDate,
    required this.prediction,
  });

  factory DailyPrediction.fromJson(Map<String, dynamic> json) {
    return DailyPrediction(
      status: json['status'] ?? false,
      sunSign: json['sun_sign'],
      predictionDate: json['prediction_date'],
      prediction: DailyPredictionDetail.fromJson(json['prediction']),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'sun_sign': sunSign,
    'prediction_date': predictionDate,
    'prediction': prediction.toJson(),
  };
}

class DailyPredictionDetail {
  final String personalLife;
  final String profession;
  final String health;
  final String emotions;
  final String travel;
  final String luck;

  DailyPredictionDetail({
    required this.personalLife,
    required this.profession,
    required this.health,
    required this.emotions,
    required this.travel,
    required this.luck,
  });

  factory DailyPredictionDetail.fromJson(List<dynamic> predictionList) {
    final Map<String, String> predictionMap = {
      for (var item in predictionList)
        if (item is Map<String, dynamic>)
          item['title']: item['description'] ?? ''
    };

    return DailyPredictionDetail(
      personalLife: predictionMap['personal_life'] ?? '',
      profession: predictionMap['profession'] ?? '',
      health: predictionMap['health'] ?? '',
      emotions: predictionMap['emotions'] ?? '',
      travel: predictionMap['travel'] ?? '',
      luck: predictionMap['luck'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'personal_life': personalLife,
    'profession': profession,
    'health': health,
    'emotions': emotions,
    'travel': travel,
    'luck': luck,
  };

  Map<String, String> toMap() => {
    'personal_life': personalLife,
    'profession': profession,
    'health': health,
    'emotions': emotions,
    'travel': travel,
    'luck': luck,
  };

  List<Map<String, String>> toList() => [
    {'title': 'personal_life', 'description': personalLife},
    {'title': 'profession', 'description': profession},
    {'title': 'health', 'description': health},
    {'title': 'emotions', 'description': emotions},
    {'title': 'travel', 'description': travel},
    {'title': 'luck', 'description': luck},
  ];
}

class TomorrowPrediction {
  final bool status;
  final String sunSign;
  final String predictionDate;
  final DailyPredictionDetail prediction;

  TomorrowPrediction({
    required this.status,
    required this.sunSign,
    required this.predictionDate,
    required this.prediction,
  });

  factory TomorrowPrediction.fromJson(Map<String, dynamic> json) {
    return TomorrowPrediction(
      status: json['status'] ?? false,
      sunSign: json['sun_sign'] ?? '',
      predictionDate: json['prediction_date'] ?? '',
      prediction: DailyPredictionDetail.fromJson(json['prediction'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'sun_sign': sunSign,
    'prediction_date': predictionDate,
    'prediction': prediction.toJson(),
  };
}

class TomorrowPredictionDetail {
  final String personalLife;
  final String profession;
  final String health;
  final String emotions;
  final String travel;
  final String luck;

  TomorrowPredictionDetail({
    required this.personalLife,
    required this.profession,
    required this.health,
    required this.emotions,
    required this.travel,
    required this.luck,
  });

  factory TomorrowPredictionDetail.fromJson(Map<String, dynamic> json) {
    return TomorrowPredictionDetail(
      personalLife: json['personal_life'] ?? '',
      profession: json['profession'] ?? '',
      health: json['health'] ?? '',
      emotions: json['emotions'] ?? '',
      travel: json['travel'] ?? '',
      luck: json['luck'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'personal_life': personalLife,
    'profession': profession,
    'health': health,
    'emotions': emotions,
    'travel': travel,
    'luck': luck,
  };
}

class MonthlyPrediction {
  final bool status;
  final String sunSign;
  final String predictionMonth;
  final List<String> prediction;

  MonthlyPrediction({
    required this.status,
    required this.sunSign,
    required this.predictionMonth,
    required this.prediction,
  });

  factory MonthlyPrediction.fromJson(Map<String, dynamic> json) {
    return MonthlyPrediction(
      status: json['status'] ?? false,
      sunSign: json['sun_sign'] ?? '',
      predictionMonth: json['prediction_month'] ?? '',
      prediction: List<String>.from(json['prediction'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'sun_sign': sunSign,
    'prediction_month': predictionMonth,
    'prediction': prediction,
  };
}






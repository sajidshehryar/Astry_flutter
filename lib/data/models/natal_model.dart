class NatalChartResponse {
  final bool success;
  final AstrologyChartData data;

  NatalChartResponse({required this.success, required this.data});

  factory NatalChartResponse.fromJson(Map<String, dynamic> json) {
    return NatalChartResponse(
      success: json['success'],
      data: AstrologyChartData.fromJson(json['data']),
    );
  }
}

class AstrologyChartData {
  final List<Planet> planets;
  final List<House> houses;
  final double ascendant;
  final double midheaven;
  final double vertex;

  AstrologyChartData({
    required this.planets,
    required this.houses,
    required this.ascendant,
    required this.midheaven,
    required this.vertex,
  });

  factory AstrologyChartData.fromJson(Map<String, dynamic> json) {
    return AstrologyChartData(
      planets: (json['planets'] as List)
          .map((e) => Planet.fromJson(e))
          .toList(),
      houses: (json['houses'] as List)
          .map((e) => House.fromJson(e))
          .toList(),
      ascendant: (json['ascendant'] as num).toDouble(),
      midheaven: (json['midheaven'] as num).toDouble(),
      vertex: (json['vertex'] as num).toDouble(),
    );
  }
}

class Planet {
  final String name;
  final double fullDegree;
  final double normDegree;
  final double speed;
  final bool isRetro;
  final int signId;
  final String sign;
  final int house;

  Planet({
    required this.name,
    required this.fullDegree,
    required this.normDegree,
    required this.speed,
    required this.isRetro,
    required this.signId,
    required this.sign,
    required this.house,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'],
      fullDegree: (json['full_degree'] as num).toDouble(),
      normDegree: (json['norm_degree'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      isRetro: json['is_retro'] == "true",
      signId: json['sign_id'],
      sign: json['sign'],
      house: json['house'],
    );
  }
}

class House {
  final int house;
  final String sign;
  final int signId;
  final double degree;

  House({
    required this.house,
    required this.sign,
    required this.signId,
    required this.degree,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      house: json['house'],
      sign: json['sign'],
      signId: json['sign_id'],
      degree: (json['degree'] as num).toDouble(),
    );
  }
}

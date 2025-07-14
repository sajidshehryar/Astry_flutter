class NatalWheelResponse {
  final bool success;
  final NatalWheelData data;

  NatalWheelResponse({
    required this.success,
    required this.data,
  });

  factory NatalWheelResponse.fromJson(Map<String, dynamic> json) {
    return NatalWheelResponse(
      success: json['success'],
      data: NatalWheelData.fromJson(json['data']),
    );
  }
}

class NatalWheelData {
  final bool status;
  final String chartUrl;
  final String msg;

  NatalWheelData({
    required this.status,
    required this.chartUrl,
    required this.msg,
  });

  factory NatalWheelData.fromJson(Map<String, dynamic> json) {
    return NatalWheelData(
      status: json['status'],
      chartUrl: json['chart_url'],
      msg: json['msg'],
    );
  }
}

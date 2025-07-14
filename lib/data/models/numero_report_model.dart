class NumerologyReportModel{
  final String title;
  final String description;

  NumerologyReportModel({
    required this.title,
    required this.description
});

  factory NumerologyReportModel.fromJson(Map<String, dynamic> json) {
    return NumerologyReportModel(
      title: json['title'],
      description: json['description'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,

    };
  }

}
class NumerologyDetail {
  final String name;
  final String date;
  final int destinyNumber;
  final int radicalNumber;
  final int nameNumber;
  final String evilNum;
  final String favColor;
  final String favDay;
  final String favGod;
  final String favMantra;
  final String favMetal;
  final String favStone;
  final String favSubstone;
  final String friendlyNum;
  final String neutralNum;
  final String radicalNum;
  final String radicalRuler;

  NumerologyDetail({
    required this.name,
    required this.date,
    required this.destinyNumber,
    required this.radicalNumber,
    required this.nameNumber,
    required this.evilNum,
    required this.favColor,
    required this.favDay,
    required this.favGod,
    required this.favMantra,
    required this.favMetal,
    required this.favStone,
    required this.favSubstone,
    required this.friendlyNum,
    required this.neutralNum,
    required this.radicalNum,
    required this.radicalRuler,
  });

  factory NumerologyDetail.fromJson(Map<String, dynamic> json) {
    return NumerologyDetail(
      name: json['name'],
      date: json['date'],
      destinyNumber: json['destiny_number'],
      radicalNumber: json['radical_number'],
      nameNumber: json['name_number'],
      evilNum: json['evil_num'],
      favColor: json['fav_color'],
      favDay: json['fav_day'],
      favGod: json['fav_god'],
      favMantra: json['fav_mantra'],
      favMetal: json['fav_metal'],
      favStone: json['fav_stone'],
      favSubstone: json['fav_substone'],
      friendlyNum: json['friendly_num'],
      neutralNum: json['neutral_num'],
      radicalNum: json['radical_num'],
      radicalRuler: json['radical_ruler'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'destiny_number': destinyNumber,
      'radical_number': radicalNumber,
      'name_number': nameNumber,
      'evil_num': evilNum,
      'fav_color': favColor,
      'fav_day': favDay,
      'fav_god': favGod,
      'fav_mantra': favMantra,
      'fav_metal': favMetal,
      'fav_stone': favStone,
      'fav_substone': favSubstone,
      'friendly_num': friendlyNum,
      'neutral_num': neutralNum,
      'radical_num': radicalNum,
      'radical_ruler': radicalRuler,
    };
  }
}

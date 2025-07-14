import 'package:flutter/cupertino.dart';

abstract class AstrologyEvent{
  const AstrologyEvent();
}
class ChangeAstrologyTab extends AstrologyEvent {
  final int index;
  ChangeAstrologyTab(this.index);
}

class GetHoroscopeDetails extends AstrologyEvent{
  BuildContext context;
  GetHoroscopeDetails({required this.context});
}

class GetNatalData extends AstrologyEvent{
  BuildContext context;
  GetNatalData({required this.context});
}

class GetNumerologyData extends AstrologyEvent{
  BuildContext context;
  GetNumerologyData({required this.context});
}

class GetNumerologyReport extends AstrologyEvent{
  BuildContext context;
  GetNumerologyReport({required this.context});
}

class GetNatalWheel  extends AstrologyEvent{
  BuildContext context;
  GetNatalWheel({required this.context});
}


import 'package:flutter/cupertino.dart';

abstract class HomeEvent{
  const HomeEvent();
}

class GetAstrology extends HomeEvent {
  BuildContext context;
  GetAstrology({required this.context});

}


class GetCompatibility extends HomeEvent {
  BuildContext context;
  GetCompatibility({required this.context});

}

class GetKnowledge extends HomeEvent {
  BuildContext context;
  GetKnowledge({required this.context});

}


class SelectSignupIndex extends HomeEvent {
  final int index;
  SelectSignupIndex(this.index, BuildContext context);
}



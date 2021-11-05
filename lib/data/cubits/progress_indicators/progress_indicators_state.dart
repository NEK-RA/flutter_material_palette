part of 'progress_indicators_cubit.dart';

@immutable
abstract class ProgressIndicatorsState {
  abstract final bool updateRequestIndicator;
}

class ProgressIndicatorsDisabled extends ProgressIndicatorsState {
  @override
  bool get updateRequestIndicator => false;
}

class ProgressIndicatorsCustom extends ProgressIndicatorsState {
  @override
  final bool updateRequestIndicator;
  ProgressIndicatorsCustom({required this.updateRequestIndicator});
}
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'progress_indicators_state.dart';

class ProgressIndicatorsCubit extends Cubit<ProgressIndicatorsState> {
  ProgressIndicatorsCubit() : super(ProgressIndicatorsDisabled());

  void switchUpdateIndicator(){
    emit(
      ProgressIndicatorsCustom(
        updateRequestIndicator: !state.updateRequestIndicator
      )
    );
  }
}

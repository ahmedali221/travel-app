import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:travel/Services/Data_Services.dart';
import 'package:travel/models/data_model.dart';

part 'app_states_state.dart';

class AppStatesCubit extends Cubit<AppStatesState> {
  AppStatesCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();

      emit(LoadedState(places));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  void detailPage(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(places));
  }
}

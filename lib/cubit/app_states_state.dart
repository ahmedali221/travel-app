// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_states_cubit.dart';

@immutable
abstract class AppStatesState extends Equatable {}

class InitialState extends AppStatesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends AppStatesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends AppStatesState {
  LoadedState(this.places);
  final List<DataModel> places;

  @override
  // TODO: implement props
  List<Object?> get props => [places];
}

class WelcomeState extends AppStatesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class goHomeState extends AppStatesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorState extends AppStatesState {
  ErrorState({required this.error});
  final String error;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailState extends AppStatesState {
  final DataModel place;
  DetailState(
    this.place,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [place];
}

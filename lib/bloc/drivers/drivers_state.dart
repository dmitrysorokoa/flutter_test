part of 'drivers_bloc.dart';

@immutable
sealed class DriversState {}

class DriversInitial extends DriversState {}

class DriversLoading extends DriversState {}

class DriversLoaded extends DriversState {
  final DriversModel driversModel;
  DriversLoaded(this.driversModel);
}

class DriversError extends DriversState {
  final String? message;
  DriversError(this.message);
}
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_1/models/drivers_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'drivers_event.dart';
part 'drivers_state.dart';

class NetworkError extends Error {}

Future<DriversModel> fetchDrivers() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    return DriversModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load drivers');
  }
}

class DriversBloc extends Bloc<DriversEvent, DriversState> {
  DriversBloc() : super(DriversInitial()) {
    on<DriversEvent>((event, emit) {
      emit(DriversInitial());
    });
    on<GetDriversList>((event, emit) async {
      try {
        emit(DriversLoading());
        final mList = await fetchDrivers();
        emit(DriversLoaded(mList));
      } on NetworkError {
        emit(DriversError("Failed to fetch data. is your device online?"));
      } catch (error) {
        final driverError = DriversModel.withError("Data not found / Connection issue");
        emit(DriversError(driverError.error));
    }
    });
  }
}

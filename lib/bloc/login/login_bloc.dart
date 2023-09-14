import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      emit(LoginInitial());
    });
    on<LoginButtonTappedEvent>(_loginButtonTapped);
    on<LogoutButtonTappedEvent>(_logoutButtonTapped);
  }

  Future<void> _loginButtonTapped(LoginButtonTappedEvent e, Emitter emit) async {
    emit(LoginProcessing(login: e.login, password: e.password));

    // todo login api call
    
    emit(LoginSuccess());
  }

  Future<void> _logoutButtonTapped(LogoutButtonTappedEvent e, Emitter emit) async {
    emit(LoginInitial());
  }
}

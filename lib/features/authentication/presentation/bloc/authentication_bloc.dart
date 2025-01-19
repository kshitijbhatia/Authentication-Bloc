import 'dart:developer';
import 'package:auth_app/core/error/data_exception.dart';
import 'package:auth_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_app/main.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:auth_app/features/authentication/domain/usecases/sign_up.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignUpUseCase _signUpUseCase;

  AuthenticationBloc(this._signUpUseCase) : super(AuthenticationInitial()) {
    on<SignUpEvent>(signUpEvent);
  }

  Future<void> signUpEvent(SignUpEvent event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationLoading());
      final User response = await _signUpUseCase(SignUpParams(event.name, event.email, event.password));
      prefs.setString("userId", response.id);
      emit(AuthenticationSuccess());
    } on DataException catch (error) {
      emit(AuthenticationFailure(error.message));
    } catch(error) {
      log("***authentication_bloc: ${error.toString()}");
      emit(AuthenticationFailure(error.toString()));
    }
  }
}

import 'dart:developer';

import 'package:auth_app/core/error/data_exception.dart';
import 'package:auth_app/core/usecase/usecase.dart';
import 'package:auth_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_app/features/authentication/domain/repositories/authentication_repo.dart';

class LoginUseCase extends UseCase<User,LoginParams>{
  final AuthenticationRepo _authenticationRepo;

  LoginUseCase(this._authenticationRepo);

  @override
  Future<User> call(LoginParams params) {
    try {
      return _authenticationRepo.login(email: params.email, password: params.password);
    } catch(error) {
      if(error is DataException) {
        rethrow;
      }
      log("***login_use_case: ${error.toString()}");
      throw DataException(error.toString());
    }
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.password, required this.email});
}
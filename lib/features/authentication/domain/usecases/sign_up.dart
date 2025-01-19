import 'dart:developer';

import 'package:auth_app/core/error/data_exception.dart';
import 'package:auth_app/core/usecase/usecase.dart';
import 'package:auth_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_app/features/authentication/domain/repositories/authentication_repo.dart';
import 'package:equatable/equatable.dart';

class SignUpUseCase implements UseCase<User, SignUpParams> {
  final AuthenticationRepo _authenticationRepo;

  const SignUpUseCase(this._authenticationRepo);

  @override
  Future<User> call(SignUpParams params) async {
    try {
      return _authenticationRepo.signUp(name: params.name, password: params.password, email: params.email);
    } catch(error) {
      if(error is DataException) {
        rethrow;
      }
      log("***sign_up_use_case: ${error.toString()}");
      throw DataException(error.toString());
    }
  }
}

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignUpParams(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}
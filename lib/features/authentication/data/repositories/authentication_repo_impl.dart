import 'dart:developer';
import 'package:auth_app/core/error/data_exception.dart';
import 'package:auth_app/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:auth_app/features/authentication/data/model/user.dart';
import 'package:auth_app/features/authentication/domain/repositories/authentication_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  final AuthDataSource _authDataSource;

  const AuthenticationRepoImpl(this._authDataSource);

  @override
  Future<UserModel> signUp({required String email, required String name, required String password}) async {
    try {
      final User response = await _authDataSource.signUp(email: email, name: name, password: password);
      return UserModel.fromJson(response.toJson());
    } catch(error) {
      if(error is DataException) {
        rethrow;
      }
      log("***authentication_repo: ${error.toString()}");
      throw DataException(error.toString());
    }
  }
}
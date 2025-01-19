import 'dart:developer';
import 'package:auth_app/core/error/data_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource {
  final SupabaseClient _supabaseClient;

  AuthDataSource(this._supabaseClient);

  Future<User> signUp({required String email, required String name, required String password}) async {
    try {
      Map<String, dynamic> data = {
        "name": name
      };
      final AuthResponse response = await _supabaseClient.auth.signUp(password: password, email: email, data: data,);
      log("response: ${response.user!.toJson()}");
      if(response.user != null) {
        return response.user!; 
      } else {
        throw DataException("Unknown error occurred");
      }
    } catch(error) {
      if(error is DataException) {
        rethrow;
      }
      log("***signUp_auth_data_source: $error");
      throw DataException("Unknown error occurred");
    }
  }
}
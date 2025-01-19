import 'package:auth_app/features/authentication/data/model/user.dart';

abstract class AuthenticationRepo {
  Future<UserModel> signUp({required String name, required String email, required String password});
}
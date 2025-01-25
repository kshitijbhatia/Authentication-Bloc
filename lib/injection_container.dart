import 'package:auth_app/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:auth_app/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:auth_app/features/authentication/domain/usecases/log_in.dart';
import 'package:auth_app/features/authentication/domain/usecases/sign_up.dart';
import 'package:auth_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {

  await dotenv.load();
  String url = dotenv.env["SUPABASE_URL"] ?? "";
  String key = dotenv.env["SUPABASE_KEY"] ?? "";

  final Supabase supabase = await Supabase.initialize(url: url, anonKey: key);

  // Supabase Client
  serviceLocator.registerLazySingleton<SupabaseClient>(() => supabase.client,);

  // Authentication Data Source
  serviceLocator.registerLazySingleton<AuthDataSource>(() => AuthDataSource(serviceLocator<SupabaseClient>()),);

  // Authentication Repo
  serviceLocator.registerLazySingleton<AuthenticationRepoImpl>(() => AuthenticationRepoImpl(serviceLocator<AuthDataSource>()),);

  // Use Cases
  serviceLocator.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(serviceLocator<AuthenticationRepoImpl>()),);
  serviceLocator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(serviceLocator<AuthenticationRepoImpl>()),);

  // Authentication Bloc
  serviceLocator.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(serviceLocator<SignUpUseCase>(), serviceLocator<LoginUseCase>()));
}
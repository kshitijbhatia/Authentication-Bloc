import 'package:auth_app/config/theme/theme.dart';
import 'package:auth_app/features/authentication/domain/usecases/sign_up.dart';
import 'package:auth_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:auth_app/features/authentication/presentation/pages/signup_page.dart';
import 'package:auth_app/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late final SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Auth',
            theme: theme(),
            home: MultiBlocProvider(
              providers: [
                BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc(serviceLocator<SignUpUseCase>()),)
              ],
              child: const SignUpPage(),
            )
        );
      },
    );
  }
}
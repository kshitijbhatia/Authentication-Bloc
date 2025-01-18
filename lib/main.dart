import 'package:auth_app/config/theme/theme.dart';
import 'package:auth_app/features/authentication/presentation/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  String url = dotenv.env["SUPABASE_URL"] ?? "";
  String key = dotenv.env["SUPABASE_KEY"] ?? "";

  await Supabase.initialize(url: url, anonKey: key);

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
            home: const SignUpPage()
        );
      },
    );
  }
}
import 'package:auth_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/config/common/common_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late final GlobalKey<FormState> _signUpKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    _signUpKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: _bodyView(),
        ),
      ),
    );
  }

  Widget _bodyView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          70.ph,
          Text("AuthApp", style: Theme.of(context).textTheme.titleLarge,),
          6.ph,
          Text("Easy Authentication for your app", style: Theme.of(context).textTheme.titleSmall,),
          60.ph,
          _formView()
        ],
      ),
    );
  }

  Widget _formView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listenWhen: (previous, current) {
          if(current is AuthenticationLoading) {
            return false;
          }
          return true;
        },
        listener: (context, state) {
          if(state is AuthenticationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Succesfully Signed Up!!", style: Theme.of(context).textTheme.displayMedium,), backgroundColor: Colors.lightGreenAccent, duration: const Duration(seconds: 3),));
          } else if(state is AuthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error, style: Theme.of(context).textTheme.displayMedium,), backgroundColor: Colors.red,duration: const Duration(seconds: 3)));
          }
        },
        child: Form(
          key: _signUpKey,
          child: Column(
            children: [
              _nameView(),
              15.ph,
              _emailView(),
              15.ph,
              _passwordView(),
              15.ph,
              _continueButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your name", style: Theme.of(context).textTheme.labelSmall,),
        4.ph,
        TextFormField(
          controller: _nameController,
          maxLines: 1,
          showCursor: false,
          validator: (value) {
            if(value == null || value.isEmpty) {
              return "Please enter your name";
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            hintText: "John Doe",
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          ),
        ),
      ],
    );
  }

  Widget _emailView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your email address", style: Theme.of(context).textTheme.labelSmall,),
        4.ph,
        TextFormField(
          controller: _emailController,
          maxLines: 1,
          showCursor: false,
          validator: (value) {
            if(value == null || value.isEmpty) {
              return "Please enter your email";
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            hintText: "abc@example.com",
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          ),
        ),
      ],
    );
  }

  Widget _passwordView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose a password", style: Theme.of(context).textTheme.labelSmall,),
        4.ph,
        TextFormField(
          controller: _passwordController,
          maxLines: 1,
          showCursor: false,
          validator: (value) {
            if(value == null || value.isEmpty) {
              return "Please enter your password";
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1,),
              borderRadius: BorderRadius.circular(20.r),
            ),
            hintText: "min. 8 characters ",
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          ),
        ),
      ],
    );
  }

  Widget _continueButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreenAccent
        ),
        onPressed: () {
          final String name = _nameController.text;
          final String email = _emailController.text;
          final String password = _passwordController.text;
          FocusScope.of(context).unfocus();
          context.read<AuthenticationBloc>().add(SignUpEvent(name: name, email: email, password: password));
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if(state is AuthenticationLoading) {
              return CircularProgressIndicator(color: Colors.white,);
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  0.ph,
                  Text("Continue", style: Theme.of(context).textTheme.labelSmall,),
                  Icon(Icons.keyboard_arrow_right_outlined, size: 18.h,)
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
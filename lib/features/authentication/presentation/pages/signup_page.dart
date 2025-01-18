import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/config/common/common_widgets.dart';
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

  @override
  void initState() {
    _signUpKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
      child: Form(
        key: _signUpKey,
        child: Column(
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
            15.ph,
            Text("Choose a password", style: Theme.of(context).textTheme.labelSmall,),
            4.ph,
            TextFormField(
              controller: _passwordController,
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
                hintText: "min. 8 characters ",
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
            15.ph,
            _continueButton()
          ],
        ),
      ),
    );
  }

  Widget _continueButton() {
    return GestureDetector(
      onTap: () {
        final String email = _emailController.text;
        final String password = _passwordController.text;

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            0.ph,
            Text("Continue", style: Theme.of(context).textTheme.labelSmall,),
            Icon(Icons.keyboard_arrow_right_outlined, size: 18.h,)
          ],
        ),
      ),
    );
  }
}
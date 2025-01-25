import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.errorMessage, required this.hintText});

  final TextEditingController controller;
  final String errorMessage;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      showCursor: false,
      validator: (value) {
        if(value == null || value.isEmpty) {
          return errorMessage;
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
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      ),
    );
  }
}
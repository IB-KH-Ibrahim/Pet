import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petstore/main.dart';

void showmessage(String message , Color color) {
          publiccontex.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        showCloseIcon: true,
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        duration: Duration(seconds: 2),
        backgroundColor:color,
        
      ),
    
    );

}

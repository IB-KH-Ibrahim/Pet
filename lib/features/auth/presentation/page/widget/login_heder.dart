import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r),
          ),
        ),
        // color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 90.w, right: 90.w),
              child: SizedBox(
                width: 200.w,
                height: 200.h,
                child: Image.asset("assets/logo_pet.png"),
              ),
            ),
            Center(
              child: Text(
                "Welcome Back to your Pet's Store",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 16, 75, 19),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

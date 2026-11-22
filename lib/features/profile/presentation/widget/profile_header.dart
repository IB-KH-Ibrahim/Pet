import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h, bottom: 15.h),
          child: Card(
            elevation: 5,
            color: Colors.white,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              width: 150.w,
              height: 150.h,
              child: Icon(
                Icons.person,
                size: 90.sp,
                color: Color.fromARGB(255, 16, 75, 19),
              ),
            ),
          ),
        ),

        Text(
          'User Name',
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 16, 75, 19),
          ),
        ),

        SizedBox(height: 10.h),

        Card(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 18.sp,
                  color: Color.fromARGB(255, 16, 75, 19),
                ),
                SizedBox(width: 8.w),
                Text(
                  'User Email',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Color.fromARGB(255, 16, 75, 19),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}

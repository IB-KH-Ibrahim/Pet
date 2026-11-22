
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.directional(
            start: 10.w,
            top: 40.h,
          ),
          child: Icon(
            Icons.pets,
            color: const Color.fromARGB(255, 16, 75, 19),
            size: 30.h,
          ),
        ),
    
        Padding(
          padding: EdgeInsetsGeometry.directional(
            start: 5.w,
            top: 40.h,
          ),
          child: Text(
            "PetStore",
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w800,
              color: const Color.fromARGB(255, 16, 75, 19),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsetsGeometry.directional(top: 40.h),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: const Color.fromARGB(255, 16, 75, 19),
              size: 30.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.directional(
            // start: 50.w,
            top: 40.h,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: const Color.fromARGB(255, 16, 75, 19),
              size: 30.h,
            ),
          ),
        ),
      ],
    );
  }
}


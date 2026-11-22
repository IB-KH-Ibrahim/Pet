
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoBanner extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        top: 10.h,
        left: 5.w,
        right: 5.w,
      ),
      child: Container(
        width: double.infinity,
        height: 175.h,
    
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: const Color.fromARGB(
                186,
                158,
                158,
                158,
              ).withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/imag_home.png',
                fit: BoxFit.fill,
              ),
            ),
    
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 20.w,
                top: 118.h,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    18,
                    109,
                    23,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Shop Now",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

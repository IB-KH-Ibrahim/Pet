import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});


  @override
  Widget build(BuildContext context) {
    final List<({IconData icon, String text, VoidCallback onPressed})>
        settingsOptions = [
      (
        icon: Icons.person_outline,
        text: 'Account Information',
        onPressed: () {},
      ),
      (
        icon: Icons.language,
        text: 'Language',
        onPressed: () {},
      ),
      (
        icon: Icons.logout,
        text: 'Log out',
        onPressed: () {},
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemCount: settingsOptions.length,
      itemBuilder: (context, index) {
        final option = settingsOptions[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: SizedBox(
            height: 60.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color.fromARGB(255, 16, 75, 19),
                elevation: 4,
                shadowColor: Colors.black26,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: option.onPressed,
              child: Row(
                children: [
                  Icon(
                    option.icon,
                    size: 22.sp,
                    color: Color.fromARGB(255, 16, 75, 19),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    option.text,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color.fromARGB(255, 16, 75, 19),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.navigate_next,
                    size: 28.sp,
                    color: Color.fromARGB(255, 16, 75, 19),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
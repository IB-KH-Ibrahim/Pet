import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petstore/features/home/presentation/widget/products_section.dart';

class BestSellingProducts extends StatelessWidget {
  const BestSellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'name': 'Pet carrier bag',
        'price': '\$35',
        'image': 'assets/pet_carrier_bag.png',
      },
      {
        'name': 'Dog chest harness',
        'price': '\$18',
        'image': 'assets/dog_chest_harness.png',
      },
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.pets,
                    color: const Color.fromARGB(255, 40, 96, 42),
                  ),
                  Text(
                    "Popular Products",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 40, 96, 42),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "See All",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 77, 150, 60),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: const Color.fromARGB(255, 77, 150, 60),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: ProductsSection(products: products),
        ),
      ],
    );
  }
}

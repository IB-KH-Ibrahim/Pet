import 'package:flutter/material.dart';
import 'package:petstore/core/widget/app_background.dart';
import 'package:petstore/features/home/presentation/widget/best_selling_products.dart';
import 'package:petstore/features/home/presentation/widget/home_header.dart';
import 'package:petstore/features/home/presentation/widget/promo_banner.dart';
import 'package:petstore/features/home/presentation/widget/side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
       child:SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(),
                PromoBanner(),
                SideBar(),
                BestSellingProducts(),
              ],
            ),
          ),
      ),
    );
  }
}

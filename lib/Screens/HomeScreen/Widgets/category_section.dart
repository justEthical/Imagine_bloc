import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:imagine_bloc/Constants/app_assets.dart';
import 'package:imagine_bloc/Constants/app_colors.dart';
import 'package:imagine_bloc/Screens/HomeScreen/Widgets/category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Catergories",
          style: TextStyle(
              fontSize: 24,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontFamily: 'Figtree'),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                CategoryCard(
                    categoryImage: AppAssets.animals, categoryName: 'Animals'),
                CategoryCard(
                    categoryImage: AppAssets.people, categoryName: 'People'),
                CategoryCard(
                    categoryImage: AppAssets.nature, categoryName: 'Nature'),
                CategoryCard(
                    categoryImage: AppAssets.fashion, categoryName: 'Fashion'),
                CategoryCard(
                    categoryImage: AppAssets.travel, categoryName: 'Travel'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

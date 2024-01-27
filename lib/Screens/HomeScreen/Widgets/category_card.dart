import 'package:flutter/material.dart';
import 'package:imagine_bloc/Constants/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String categoryImage;
  final String categoryName;
  const CategoryCard(
      {super.key, required this.categoryImage, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      margin: EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, offset: Offset(0, 5), blurRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  categoryImage,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black38.withOpacity(0.2)),
            child: Center(
                child: Text(
              categoryName,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}

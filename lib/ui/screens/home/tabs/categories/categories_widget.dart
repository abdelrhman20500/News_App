import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoryDM categoryDM;
   const CategoriesWidget({super.key, required this.categoryDM});
  final Radius radius = const Radius.circular(16);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDM.backgroundColor,
        borderRadius:BorderRadius.only(
          topRight: radius, topLeft: radius,
          bottomLeft: categoryDM.isLeftSided ? Radius.zero : radius,
          bottomRight: !categoryDM.isLeftSided ? Radius.zero : radius,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath, height: MediaQuery.of(context).size.height*0.14,),
          const SizedBox(height: 4),
          Text(categoryDM.title, style: const TextStyle(
            fontSize: 18, color: Colors.white
          ),),
        ],
      ),
    );
  }
}

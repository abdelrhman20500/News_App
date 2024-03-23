import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_widget.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab(this.onCategoryClick, {Key? key}) : super(key: key);
  final Function(CategoryDM) onCategoryClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("pick your category",textAlign: TextAlign.start, style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 28,
          ),),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: CategoryDM.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        onCategoryClick(CategoryDM.categories[index]);
                      },
                      child: CategoriesWidget(categoryDM: CategoryDM.categories[index],));
                }
            ),
          ),
        ],
      ),
    );
  }
}

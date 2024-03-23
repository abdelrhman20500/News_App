import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news/news_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "HomeScreen";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;
  @override
  void initState() {
    super.initState();
   currentTab= CategoriesTab(onCategoryClick);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()
      {
        if(currentTab is! CategoriesTab)
          {
            currentTab = CategoriesTab(onCategoryClick);
            setState(() {});
                return Future.value(false);
          }else{
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          centerTitle: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          )),
        ),
        body: currentTab,
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM){
    currentTab = NewsTab();
    setState(() {});
  }
}

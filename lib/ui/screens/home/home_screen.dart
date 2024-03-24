import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_tab.dart';

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
        drawer: buildDrawer(),
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM){
    currentTab = NewsTab();
    setState(() {});
  }

  buildDrawer()=>Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
                child: Text(
                  "News app",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ))),
        buildDrawerRow(Icons.list, "Categories", ()
        {
          currentTab = CategoriesTab(onCategoryClick);
          setState(() {});
          Navigator.pop(context);
        }),
        buildDrawerRow(Icons.settings, "Settings", ()
        {
          currentTab= const SettingsTab();
          setState(() {});
          Navigator.pop(context);
        }),
      ],
    ),
  );

  buildDrawerRow(IconData iconData, String title, Function onClick)
  {
    return InkWell(
      onTap: ()
      {
        onClick();
      },
      child: Row(
        children: [
          const SizedBox(width: 16,),
          Icon(
            iconData,
            color: Colors.black,
            size: 35,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

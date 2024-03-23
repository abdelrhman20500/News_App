import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/source_response.dart';

import 'newlist/news_list.dart';

class NewsTab extends StatefulWidget {
   NewsTab({Key? key}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
 int indexSelected =0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return buildTab(snapshot.data!);
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  Widget buildTab(List<SourceDM>list){
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          const SizedBox(height: 8),
          TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index){
                indexSelected= index;
                setState(() {});
              },

              /// ازاي احول من list---->list
              /// ازاي اخلي التابات علي اد list
              tabs: list.map((source) => buildTabWidget(source.name ??"",
                  indexSelected ==list.indexOf(source))).toList()),
          Expanded(
            child: TabBarView(children:
                     list.map((source) => NewsList(sourceId: source.id!,)).toList()),
            ),
        ],
      ),
    );
  }

  Widget buildTabWidget(String name , bool isSelected){
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ?Colors.blue :Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.blue)
      ),
      child: Text(name??"",
        style:  TextStyle(color: isSelected ? Colors.white :Colors.black),),
    );
  }
}

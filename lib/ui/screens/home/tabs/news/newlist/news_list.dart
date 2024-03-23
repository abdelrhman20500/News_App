import 'package:flutter/material.dart';
import '../../../../../../data/api/api_manager.dart';
import '../../../../../../data/model/articles_respones.dart';
import '../../../../../../widget/article_widget.dart';
import '../../../../../../widget/erreo_view.dart';
import '../../../../../../widget/loading_widget.dart';

class NewsList extends StatelessWidget {
  final String sourceId;
  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(sourceId),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return buildArticlesListView(snapshot.data!);
          }else if(snapshot.hasError){
            return ErrorView(message: snapshot.error.toString());
          }else {
            return const LoadingWidget();
          }
        });
  }
  buildArticlesListView(List<Article> articles){
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return ArticleWidget(article: articles[index],);
        }
    );
  }
}

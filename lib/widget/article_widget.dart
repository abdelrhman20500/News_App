import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/model/articles_respones.dart';


class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage!,
              placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __,___) => const Icon(Icons.error),
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .25,),
          ),
          const SizedBox(height: 4,),
          Text(article.source?.name??"" ),
          const SizedBox(height: 4,),
          Text(article.title??""),
          const SizedBox(height: 4,),
          Text(article.publishedAt??"", textAlign: TextAlign.end,)
        ],
      ),
    );
  }
}

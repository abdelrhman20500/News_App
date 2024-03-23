import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/data/model/articles_respones.dart';
import 'package:news_app/data/model/source_response.dart';

abstract class ApiManager{
  static const String baseUrl="newsapi.org";
 static const String apiKey ="7ce27bdaf29e4394b21fa413d090a5e7";
 static const String sourcesEndPoint ="/v2/top-headlines/sources";

 /// first method
  static  Future<List<SourceDM>>getSources()async {
    Uri url =Uri.parse("https://$baseUrl$sourcesEndPoint?apiKey=$apiKey");
    Response response= await get(url);
    /// convert String to map !!
    Map json = jsonDecode(response.body);
    SourcesResponseDM sourcesResponseDM = SourcesResponseDM.fromJson(json);
    if(response.statusCode >=200 && response.statusCode <300 &&
    sourcesResponseDM.sources!.isNotEmpty == true){
      return sourcesResponseDM.sources!;
    }else{
      throw Exception(sourcesResponseDM.message);
    }
  }

  /// second method
  static Future<List<Article>> getArticles(String sourceId)async{
    Uri url= Uri.https(baseUrl ,"v2/everything", {
      "apiKey":apiKey,
      "sources":sourceId,
    });
    var serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if(serverResponse.statusCode >=200 && serverResponse.statusCode<300
    && articlesResponse.articles?.isNotEmpty==true){
      return articlesResponse.articles!;
    }else{
      throw Exception("Something went wrong please try again later!...");
    }
  }
}
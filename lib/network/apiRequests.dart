import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/UI/HomeScreen/DetailCategory/articalsListview.dart';
import 'package:news/UI/HomeScreen/model/SourcesData.dart';
import 'package:news/UI/HomeScreen/model/articalsDatamodel.dart';
import 'package:news/network/EndPoints.dart';
import 'package:news/network/api_constant.dart';

abstract class Apirequests {


static  Future<ListSourcesData> getSources(String categoryid)async{

    var queryparam ={
      'apiKey': ApiConstant.apiKey,
      "category": categoryid,
    };
  var reponse = await http.get(Uri.https(ApiConstant.baseUrl, Endpoints.getSources, queryparam));
  
  if(reponse.statusCode==200){
    var data =jsonDecode(reponse.body);
    ListSourcesData listSourcesData = ListSourcesData.fromJson(data);
    return listSourcesData;
}
  else{
    throw Exception('Failed to load data');
  }

  }

static  Future<ArticlesListData> getArticals(String sourcesid)async{

    var queryparam ={
      'apiKey': ApiConstant.apiKey,
      "sources": sourcesid,
    };
  var reponse = await http.get(Uri.https(ApiConstant.baseUrl, Endpoints.getArticals, queryparam));
  
  if(reponse.statusCode==200){
    var data =jsonDecode(reponse.body);
    ArticlesListData articalslistview = ArticlesListData.fromJson(data);
    return articalslistview.articles!.isNotEmpty ? articalslistview : throw Exception('No articles found');
}
  else{
    throw Exception('Failed to load data');
  }

  }
static  Future<ArticlesListData> searchArticals(String querysearch , int numberPageitem )async{

    var queryparam ={
      'apiKey': ApiConstant.apiKey,
      "q": querysearch,
      "pageSize":'10',
      "page": numberPageitem.toString(),
    };
  var reponse = await http.get(Uri.https(ApiConstant.baseUrl, Endpoints.getArticals, queryparam));
  
  if(reponse.statusCode==200){
    var data =jsonDecode(reponse.body);
    ArticlesListData articalslistview = ArticlesListData.fromJson(data);
    return articalslistview.articles!.isNotEmpty ? articalslistview : throw Exception('No articles found');
}
  else{
    throw Exception('Failed to load data');
  }

  }




}
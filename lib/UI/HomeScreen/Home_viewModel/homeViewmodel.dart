import 'package:flutter/material.dart';
import 'package:news/Core/assets/images/imagespath.dart';
import 'package:news/UI/HomeScreen/model/CategoryDataModel.dart';
import 'package:news/UI/HomeScreen/model/SourcesData.dart';
import 'package:news/UI/HomeScreen/model/articalsDatamodel.dart';
import 'package:news/network/apiRequests.dart';

class HomeviewModel extends ChangeNotifier {
    int _selectedIndex = 0;
    List<SourcesData> _sources = [];
     List<Articles>? _articles = [];


  List<Categorydatamodel> categories = [
    Categorydatamodel(id: 'General', category: 'General', imagepath: ImagesPath.general),
    Categorydatamodel(id: 'Business', category: 'Business', imagepath: ImagesPath.business),
    Categorydatamodel(id: 'Entertainment', category: 'Entertainment', imagepath: ImagesPath.entertainment),
    Categorydatamodel(id: 'Health', category: 'Health', imagepath: ImagesPath.health),
    Categorydatamodel(id: 'Science', category: 'Science', imagepath: ImagesPath.science),
    Categorydatamodel(id: 'Technology', category: 'Technology', imagepath: ImagesPath.technology),
    Categorydatamodel(id: 'Sports', category: 'Sports', imagepath: ImagesPath.sports),

  ];
    Categorydatamodel? _selectedCategory;
    get selectedIndex => _selectedIndex;
    List<Articles> _searchResults = [];

   void onChangeIndex(int index) {
    _selectedIndex = index;
    fetchArticles(sourcesList[index].id);
    notifyListeners();
  }

  List<Articles> get articlesList => _articles ?? []; 

  List<Articles>? get searchArticalsList => _searchResults;

  List<SourcesData> get sourcesList => _sources;

  Categorydatamodel? get selectedCategory => _selectedCategory;
  set selectedCategory(Categorydatamodel? category) {
    _selectedCategory = category;
    notifyListeners();
  }
    void onCategorySelected(Categorydatamodel category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> fetchSources() async {
  try {
    final response = await Apirequests.getSources(_selectedCategory!.id);
    _sources = response.sources; 
    notifyListeners();
  } catch (e) {
    rethrow;
  }

  }
  Future<void> fetchArticles(String soureid) async {
    try {
      final response = await Apirequests.getArticals(soureid);
      _articles = response.articles; 
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
  Future<void> searchArticalsResult(String querysearch , int numberPageitem) async {
    try {
      final response = await Apirequests.searchArticals( querysearch , numberPageitem);
      if (numberPageitem == 1) {
        _articles = response.articles ?? [];
        notifyListeners();
      } else {
        _articles?.addAll(response.articles ?? []);
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }



  clearvalue(){
    _sources = [];
    _articles = [];
    _selectedIndex = 0;
    notifyListeners();
  }





  

 

}
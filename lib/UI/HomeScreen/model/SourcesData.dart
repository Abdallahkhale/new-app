class ListSourcesData{
  String status ;
  List<SourcesData> sources ;

  ListSourcesData(this.status, this.sources);

  factory ListSourcesData.fromJson(Map<String,dynamic>json){
    var list = json['sources'] as List;
    List<SourcesData> sourcesList = list.map((i) => SourcesData.fromJson(i)).toList();
    return ListSourcesData(
      json['status'],
      sourcesList
    );
  }
}
class SourcesData{
  String id ;
  String name ;
  String description ;
  String url ;
  String category ;
  String language ;
  String country ;

  SourcesData({required this.id, required this.name,required this.description,required this.url,required this.category,
     required this.language,required this.country});

  factory SourcesData.fromJson(Map<String,dynamic>json){
    return SourcesData(
      id: json['id']??'',
      name: json['name']??'',
      description: json['description']??'',
      url: json['url']??'',
      category: json['category']??'',
       language: '${json['language']}',
        country: json['country']??'',
      

    );
  }

}
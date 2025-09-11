import 'package:flutter/material.dart';
import 'package:news/UI/HomeScreen/Home_viewModel/homeViewmodel.dart';
import 'package:news/UI/HomeScreen/model/SourcesData.dart';
import 'package:news/UI/HomeScreen/model/articalsDatamodel.dart';
import 'package:news/network/apiRequests.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Articalslistview extends StatefulWidget {
   Articalslistview( {super.key, required this.source});
  final SourcesData source;

  @override
  State<Articalslistview> createState() => _ArticalslistviewState();
}

class _ArticalslistviewState extends State<Articalslistview> {
  void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<HomeviewModel>(context, listen: false).fetchArticles(widget.source.id);
  });
}
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeviewModel>(
      builder: (context, provider, _){
        if(provider.articlesList.isEmpty){
          return const Center(child: CircularProgressIndicator());
        }
      
        return Expanded(
          child: ListView.builder(
            itemCount: provider.articlesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _showArticleDetails(context, provider.articlesList[index]);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (provider.articlesList[index].urlToImage != null)
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              provider.articlesList[index].urlToImage!,
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (provider.articlesList[index].title != null)
                                Text(
                                  provider.articlesList[index].title!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            
                              const SizedBox(height: 8),
                             
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                      
                                      Text(
                                        '${provider.articlesList[index].source?.name} ',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    Text(
                                        '${DateTime.parse(provider.articlesList[index].publishedAt!).day}/${DateTime.parse(provider.articlesList[index].publishedAt!).month}/${DateTime.parse(provider.articlesList[index].publishedAt!).year}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
      
      );
    
  }
  
  void _showArticleDetails(BuildContext context, Articles articlesList) {

      showModalBottomSheet(
        backgroundColor: Colors.black,
        isScrollControlled: true,
        context: context, builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (articlesList.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  articlesList.urlToImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 8),
            if (articlesList.title != null)
              Text(
                articlesList.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 8),
            if (articlesList.description != null)
              Text(
                articlesList.description!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            const SizedBox(height: 8),
            FilledButton(
              
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: (){
                //launchUrl(Uri(scheme: 'tel',path: '1234567890'),);
             launchUrl(Uri.parse(articlesList.url!, ) , mode: LaunchMode.inAppWebView);
              }, child: const Text('View Full Article'))
           
          
          ],
      )
      ));

  }
}


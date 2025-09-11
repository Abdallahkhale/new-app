import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/UI/HomeScreen/Home_viewModel/homeViewmodel.dart';
import 'package:news/UI/HomeScreen/model/articalsDatamodel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});
  static const String routeName = '/search';

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchController = TextEditingController();

  
 void performSearch(String value, BuildContext context) {
  if (value.isEmpty) {
    return;
  }
  final provider = context.read<HomeviewModel>();
  provider.searchArticalsResult(value, 1);
  searchResults = provider.searchArticalsList ?? [];
  setState(() {});
}
  List<Articles> searchResults = [];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
         SliverAppBar(
        
          floating: true,
          leading: const SizedBox.shrink(),
          leadingWidth: 0
          ,
          toolbarHeight: 80
          ,
          title: TextFormField(
            onChanged: (value) {
              performSearch(value.toString(), context);
              setState(() {});
            },
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search , color: Colors.black,),
              suffixIcon: InkWell(
                onTap: (){
                 Navigator.pop( context);
                searchController.clear();
                },
                child: const Icon(Icons.close , color: Colors.black,)),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black))
           , enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)),
                disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black)),


            ),

          
          ),
         )
,
   Consumer<HomeviewModel>(
    builder: (context, provider, _) {
      if (provider.articlesList.isEmpty) {
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 400, // Give it a fixed height
            child: LottieBuilder.asset('assets/animation/empty.json'),
          ),
        );
      }
  
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
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
          childCount: provider.articlesList.length,
        ),
      );
    },
  ),



        ],
      ),
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
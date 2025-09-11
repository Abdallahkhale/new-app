import 'package:flutter/material.dart';
import 'package:news/UI/HomeScreen/DetailCategory/Customtextbar.dart';
import 'package:news/UI/HomeScreen/DetailCategory/articalsListview.dart';
import 'package:news/UI/HomeScreen/Home_viewModel/homeViewmodel.dart';
import 'package:news/UI/HomeScreen/model/CategoryDataModel.dart';
import 'package:news/network/apiRequests.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<HomeviewModel>(context, listen: false).fetchSources();
  });
}

      
     @override
    Widget build(BuildContext context) {
  return Consumer<HomeviewModel>(
    builder: (BuildContext context, HomeviewModel provider, Widget? child) { 
      if(provider.sourcesList.isEmpty){
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        children: [
          DefaultTabController(
            length: provider.sourcesList.length, 
            child: TabBar(
              onTap: provider.onChangeIndex,
              dividerColor: Colors.transparent,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: provider.sourcesList.map((e) => Customtextbar(
                data: e, 
                selected: provider.sourcesList.indexOf(e) == provider.selectedIndex,
              )).toList(),
            )
          ),
          Articalslistview(source: provider.sourcesList[provider.selectedIndex])
        ]
      );
    },
  );
}
    
  }

       
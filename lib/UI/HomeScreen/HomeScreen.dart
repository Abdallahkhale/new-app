import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news/Core/Custom_widgets/Homescreen/Custom_drawer.dart';
import 'package:news/Core/Custom_widgets/Homescreen/category_card.dart';
import 'package:news/Core/assets/images/imagespath.dart';
import 'package:news/UI/HomeScreen/DetailCategory/detailCategoryPage.dart';
import 'package:news/UI/HomeScreen/Home_viewModel/homeViewmodel.dart';
import 'package:news/UI/HomeScreen/model/CategoryDataModel.dart';
import 'package:news/UI/HomeScreen/search/searchScreen.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  static const String routeName = '/home';
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {
    return 
       Consumer<HomeviewModel>(
        builder: (context   , provider ,_){
       
          return Scaffold(
        drawer: CustomDrawer(
          onTap: (){
            provider.selectedCategory = null;
              provider.clearvalue();
            Navigator.pop(context);
          },
        ),
       appBar: AppBar(
          title: Text(provider.selectedCategory == null ? 'Home Screen' : provider.selectedCategory!.category),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, Searchscreen.routeName);
              },
            ),
          ],
         
       
      )
      ,body:provider.selectedCategory == null ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
             Text('Good Morning\nHere is Some News For You',style: Theme.of(context).textTheme.bodyLarge,),
      
              const SizedBox(height: 20,),
      
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => CustomCategoryCard(
                  category: provider.categories[index],index: index,onTap:provider.onCategorySelected,
                  ),
                 separatorBuilder: (context, index) => const SizedBox(height: 10,),
                itemCount: provider.categories.length,
                  )
            ],
            
          ),
        ),
      ) : Center(
        child: CategoryDetails(),
      ),
      
      );
        }
        
      
      
    );
  }

}
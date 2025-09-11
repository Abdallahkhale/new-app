import 'package:flutter/material.dart';
import 'package:news/UI/HomeScreen/model/CategoryDataModel.dart';

class CustomCategoryCard extends StatelessWidget {
   CustomCategoryCard({super.key, required this.category , required this.onTap ,required this.index});
  final Categorydatamodel category;
  final int index;
  final Function(Categorydatamodel) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: index.isEven ?   Alignment.bottomRight : Alignment.bottomLeft,
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(category.imagepath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Directionality(
          textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
       
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'View All',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed:(){
                      onTap(category);
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ),
                ),
           
              
              
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width *0.6;
    return Container(
      
      height: double.infinity,
      width: width,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: 166,
            child: Text('News App',style: Theme.of(context).textTheme.headlineMedium,),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => onTap(),
            child: Row(
              children: [
                const Icon(Icons.home,color: Colors.white,),
                const SizedBox(width: 10),
                Text('Go To Home',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)
              ],
            ),
          ),
          const Divider(color: Colors.white,thickness: 2,),
          const SizedBox(height: 20),
       
            Row(
              children: [
                const Icon(Icons.format_paint_rounded,color: Colors.white,),
                const SizedBox(width: 10),
                Text('Theme',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)
              ],
           
          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8 ,vertical: 8),

              child:  CustomDropdown<String>(
                decoration:CustomDropdownDecoration(
                  expandedFillColor: Colors.white,
                  
                  headerStyle: const TextStyle(
                  color: Colors.blue,
                    fontSize: 18,
                  ),
                 
                  closedFillColor: Colors.transparent,
                  
                  closedSuffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.white , size: 30,),
                  closedBorder: Border.all(
                    color: Colors.white
                  ),
                ),
             items: const <String>['Dark','Light' ],
             
            initialItem: 'Dark',
            onChanged: (value) {
             },
              ),
            ),
             const Divider(color: Colors.white,thickness: 2,),
              const SizedBox(height: 20),
              Row(
              children: [
                const Icon(Icons.language, color: Colors.white,),
                const SizedBox(width: 10),
                Text('Language',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)
              ],
           
          ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8 ,vertical: 8),

              child:  CustomDropdown<String>(
                decoration:CustomDropdownDecoration(
                  
                  headerStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                  closedFillColor: Colors.transparent,

                  closedSuffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.white , size: 30,),
                  closedBorder: Border.all(
                    color: Colors.white
                  ),
                ),
             items: const <String>['English','العربيه' ],
             
            initialItem: 'English',
            onChanged: (value) {
            // value == 'English' ? provider.setLanguage('en') : provider.setLanguage('ar');
             },
              ),
            ),

        ],
      ),
    );
  }
}
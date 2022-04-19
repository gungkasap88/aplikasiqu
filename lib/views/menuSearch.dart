import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menuSearch extends StatefulWidget {
  const menuSearch({Key? key}) : super(key: key);

  @override
  State<menuSearch> createState() => _menuSearchState();
}

class _menuSearchState extends State<menuSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              // Kolom Search
              Container(
                child: Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Container(
                   decoration: BoxDecoration(
                       color: Colors.grey[200],
                       borderRadius: BorderRadius.circular(12),
                   ),
                   padding: EdgeInsets.all(12),
                   child: Row(
                     children: [
                       Icon(
                         Icons.search,
                         color: Colors.grey[600],
                       ),
                       SizedBox(width: 15,),
                       Text(
                         'Search',
                         style: TextStyle(
                           color: Colors.grey[500],
                         ),
                       )
                     ],
                   ),
                 ),
                )
              ),
              SizedBox(height: 2,),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                ),
                itemCount: 50,
                itemBuilder: (context, index) => Image.network(
                  "https://picsum.photos/id/${350 + index}/500/500",
                ),
              )
            ],
          ),
      ),
    );
  }
}

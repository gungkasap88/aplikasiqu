import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class viewHome extends StatefulWidget {
  const viewHome({Key? key}) : super(key: key);

  @override
  State<viewHome> createState() => _viewHomeState();
}

class _viewHomeState extends State<viewHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "gungkasap",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_box_outlined),
                      ),
                      SizedBox(width: 5,),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Divider(thickness: 1, color: Colors.grey[150])
            ),
            // Container(
            //   margin: EdgeInsets.all(16),
            //   height: 200.0,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: <Widget>[
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           Column(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(38.0),
            //                 child: Image.network('https://i1.wp.com/liburmulu.com/wp-content/uploads/2015/07/City-view-malam-hari-kota-Jakarta.jpg',
            //                   width: 74.0,
            //                   height: 74.0,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               SizedBox(height: 5,),
            //               Text("Cerita Anda"),
            //             ],
            //           ),
            //           const SizedBox(width: 20,),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: 95,
                  height: 95,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.red, Colors.amber],
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.grey[300],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://i1.wp.com/liburmulu.com/wp-content/uploads/2015/07/City-view-malam-hari-kota-Jakarta.jpg"),
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 4
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}

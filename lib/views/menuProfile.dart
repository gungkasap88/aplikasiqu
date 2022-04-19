import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aplikasiqu/modules/listStories.dart';
import 'package:http/http.dart' as http;

class menuProfile extends StatefulWidget {
  const menuProfile({Key? key}) : super(key: key);

  @override
  State<menuProfile> createState() => _menuProfileState();
}

class _menuProfileState extends State<menuProfile> {

  //note: ini dari API
  List<Data> dataListApi = [];
  final String apiUrl = "https://reqres.in/api/users?per_page=15";

  Future<listStories> getListRepository(BuildContext context) async {
    var uri = Uri.parse(apiUrl).replace();
    try{
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return listStories.fromJson(jsonDecode(response.body));
      } else {
        return listStories.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return listStories.withError("Waktu Habis, Silahkan coba kembali");
    }
  }

  void getListViewModel(BuildContext context) async {
    final response = await getListRepository(context);
    if (response.error == null) {
      setState(() {
        dataListApi = response.data!;
      });
    } else {
      print(response.error.toString());
    }
  }

  @override
  void initState() {
    //setData();
    getListViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          children: [
            // Appbar home
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
            // Profile info
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Row(
            //     children: [
            //       Column(
            //         children: [
            //           Container(
            //             margin: EdgeInsets.symmetric(horizontal: 15),
            //             width: 90,
            //             height: 90,
            //             child: Stack(
            //               alignment: Alignment.center,
            //               children: [
            //                 Container(
            //                   decoration: BoxDecoration(
            //                     gradient: LinearGradient(
            //                       begin: Alignment.topCenter,
            //                       end: Alignment.bottomCenter,
            //                       colors: [Colors.red, Colors.amber],
            //                     ),
            //                     borderRadius: BorderRadius.circular(60),
            //                   ),
            //                 ),
            //                 Container(
            //                   width: 85,
            //                   height: 85,
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(60),
            //                       color: Colors.grey[300],
            //                       image: DecorationImage(
            //                         fit: BoxFit.cover,
            //                         //image: NetworkImage("https://i1.wp.com/liburmulu.com/wp-content/uploads/2015/07/City-view-malam-hari-kota-Jakarta.jpg"),
            //                         image: AssetImage("assests/igprofil.jpeg"),
            //                       ),
            //                       border: Border.all(
            //                           color: Colors.white,
            //                           width: 4
            //                       )
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           SizedBox(height: 10,),
            //           Container(
            //             child: Text(
            //               "Agung Eka Saputra",
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 10,),
            //           // Container(
            //           //   child: RichText(
            //           //     text: TextSpan(
            //           //       text: "Look for something positive in every day, even if some days you have to look a little harder.",
            //           //       style: TextStyle(
            //           //         color: Colors.grey[750],
            //           //       ),
            //           //         children: [
            //           //           TextSpan(
            //           //             text: "#motivasi\n",
            //           //             style: TextStyle(
            //           //               color: Colors.blue,
            //           //             ),
            //           //           ),
            //           //           TextSpan(
            //           //               text: "Link goes here",
            //           //               style: TextStyle(
            //           //                 color: Colors.blue,
            //           //               )
            //           //           )
            //           //         ]
            //           //     ),
            //           //   ),
            //           // ),
            //           // Padding(
            //           //   padding: EdgeInsets.symmetric(horizontal: 15),
            //           //   child: RichText(
            //           //     text: TextSpan(
            //           //       text: "Look for something positive in every day, even if some days you have to look a little harder.",
            //           //       style: TextStyle(
            //           //         color: Colors.grey[750],
            //           //       ),
            //           //       children: [
            //           //         TextSpan(
            //           //           text: "#motivasi\n",
            //           //           style: TextStyle(
            //           //             color: Colors.blue,
            //           //           ),
            //           //         ),
            //           //         TextSpan(
            //           //           text: "Link goes here",
            //           //           style: TextStyle(
            //           //             color: Colors.blue,
            //           //           )
            //           //         )
            //           //       ]
            //           //     ),
            //           //   ),
            //           // )
            //         ],
            //       ),
            //       // Profile user
            //
            //       Expanded(
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               InfoProfile(
            //                 title: "Posts",
            //                 total: 89.toString(),
            //               ),
            //               InfoProfile(
            //                 title: "Followers",
            //                 total: 729.toString(),
            //               ),
            //               InfoProfile(
            //                 title: "Following",
            //                 total: 756.toString(),
            //               ),
            //             ],
            //           ),
            //       ),
            //     ],
            //   ),
            // )

            // Profil info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  // Profil user
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: 100,
                    height: 100,
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
                          width: 95,
                          height: 95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.grey[300],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                //image: NetworkImage("https://i1.wp.com/liburmulu.com/wp-content/uploads/2015/07/City-view-malam-hari-kota-Jakarta.jpg"),
                                image: AssetImage("assests/igprofil.jpeg"),
                              ),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 4
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoProfile(
                          title: "Posts",
                          total: 89.toString(),
                        ),
                        InfoProfile(
                          title: "Followers",
                          total: 729.toString(),
                        ),
                        InfoProfile(
                          title: "Following",
                          total: 756.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            // Username
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Agung Eka Saputra",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 7),
            // Bio
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                text: TextSpan(
                    text: "Look for something positive in every day, even if some days you have to look a little harder.",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                    children: [
                      TextSpan(
                        text: "#hastag\n",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                          text: "Link goes here",
                          style: TextStyle(
                            color: Colors.blue,
                          )
                      ),
                    ]
                ),
              ),
            ),
            SizedBox(height: 15),
            // Edit profile
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Edit Profile"),
              ),
            ),
            SizedBox(height: 5),
            // Stories
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Container(
                            width: 71,
                            height: 71,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://picsum.photos/seed/${index + 237}/500/500",
                                  ),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("Story ${index + 1}"),
                  ],
                ),
              ),
            ),
            // Row icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.grid_on_outlined),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person_pin_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            // Feed
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
              ),
              itemCount: 20,
              itemBuilder: (context, index) => Image.network(
                "https://picsum.photos/id/${64 + index}/500/500",
              ),
            )
          ],
        )
    );
  }
}

class InfoProfile extends StatelessWidget {
  const InfoProfile({Key? key, required this.title, required this.total}) : super(key: key);

  final String title;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          total,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(title)
      ],
    );
  }
}


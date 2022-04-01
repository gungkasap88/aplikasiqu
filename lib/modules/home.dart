import 'package:aplikasiqu/modules/viewHome.dart';
import 'package:aplikasiqu/views/viewLogin.dart';
import 'package:aplikasiqu/views/viewLoginn.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  int currentIndex = 0;
  final List<Widget> body = [
    viewHome(),
    Center(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        'Reels',
        style: TextStyle(fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        'Shop',
        style: TextStyle(fontSize: 20),
      ),
    ),
    viewLoginn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: ontap,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home_outlined, color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.search, color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.video_collection_outlined, color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.shop_outlined, color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.person, color: Colors.black,),
          ),
        ],
      ),
    );
  }
  void ontap(int index){
    setState(() {
      currentIndex = index;
    });
  }
}

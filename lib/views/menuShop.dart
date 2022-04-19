import 'package:flutter/material.dart';

class menuShop extends StatefulWidget {
  const menuShop({Key? key}) : super(key: key);

  @override
  State<menuShop> createState() => _menuShopState();
}

class _menuShopState extends State<menuShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // Appbar home
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Toko",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.event_note_outlined),
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
            //SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)
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
                        color: Colors.grey[800],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          )
                        ),
                        child: Text(
                          'Toko',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        //color: Colors.grey[500],
                      ),
                    ),
                  SizedBox(width: 10,),
                  Container(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          )
                      ),
                      child: Text(
                        'Video',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                      //color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          )
                      ),
                      child: Text(
                        'Pilihan Editor',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                      //color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

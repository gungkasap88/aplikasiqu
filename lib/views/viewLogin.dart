import 'package:aplikasiqu/form.dart';
import 'package:aplikasiqu/formNew.dart';
import 'package:aplikasiqu/views/newLogin.dart';
import 'package:aplikasiqu/views/viewLoginn.dart';
import 'package:aplikasiqu/views/viewSignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class viewLogin extends StatefulWidget {
  const viewLogin({Key? key}) : super(key: key);

  @override
  State<viewLogin> createState() => _viewLoginState();
}

class _viewLoginState extends State<viewLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left:30,top:10,right:30,bottom:10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://th.bing.com/th/id/R.616f49b0f9e456cd455dee007d71d8a2?rik=8RC5fdMDKS2nBQ&riu=http%3a%2f%2fwww.pngpix.com%2fwp-content%2fuploads%2f2016%2f10%2fPNGPIX-COM-Panda-Vector-PNG-Transparent-Image.png&ehk=djwQJyPBtT6qxD2qF8Co4Y%2faorba2GYyETczS4AamaU%3d&risl=&pid=ImgRaw&r=0",
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20,),
            const Text("SUPANDA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 30,),
            const Text("Discover upcoming events near you",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.grey,
                ),
            ),
            const SizedBox(height: 80,),
            ElevatedButton(
              child: Text("Sign Up"),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.lightBlue,
                  minimumSize: Size(150,50),
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 140
                  )
              ),
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => viewSignup()
                    )
                );
              },
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              child: Text("Log in"),
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.lightBlue,
                  primary: Colors.white,
                  side: BorderSide(color: Colors.lightBlue, width: 1),
                  minimumSize: Size(150,50),
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 140
                  )
              ),
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => newLogin()
                    )
                );
              },
            ),
            const SizedBox(height: 40,),
            TextButton(
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => formNew()
                    )
                );
              },
              child: Text(
                "Skip for now",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

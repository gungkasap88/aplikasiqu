import 'package:aplikasiqu/modules/home.dart';
import 'package:aplikasiqu/modules/viewHome.dart';
import 'package:aplikasiqu/views/viewLogin.dart';
import 'package:aplikasiqu/views/viewSignup.dart';
import 'package:flutter/material.dart';

import '../form.dart';

class newLogin extends StatefulWidget {
  const newLogin({Key? key}) : super(key: key);

  @override
  State<newLogin> createState() => _newLoginState();
}

class _newLoginState extends State<newLogin> {

  final _formKey = GlobalKey<FormState>();
  var textController = new TextEditingController();
  var text2Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //menghilangkan yellow cross
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://th.bing.com/th/id/R.616f49b0f9e456cd455dee007d71d8a2?rik=8RC5fdMDKS2nBQ&riu=http%3a%2f%2fwww.pngpix.com%2fwp-content%2fuploads%2f2016%2f10%2fPNGPIX-COM-Panda-Vector-PNG-Transparent-Image.png&ehk=djwQJyPBtT6qxD2qF8Co4Y%2faorba2GYyETczS4AamaU%3d&risl=&pid=ImgRaw&r=0",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: text2Controller,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: "Pasword",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: Text("Log in"),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.lightBlue,
                    //onSurface: Colors.grey,
                    //side: BorderSide(color: Colors.black, width: 1),
                    //elevation: 20,
                    minimumSize: Size(330,50),
                    //shadowColor: Colors.teal,
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10
                    )
                ),
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => home()
                          )
                      );
                      print("text 1 value => " + textController.text);
                      print("text 2 value => " + text2Controller.text);

                      //print("checkbox value => " + checkedValue.toString());
                      //print("checkbox value => " + _selectedGender.toString());
                    } else {
                      print("Lengkapi data");
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Informasi'),
                            content: Text('Silahkan Lengkapi Data Anda'),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )
                      );
                    }
                  });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => form()
                  //     )
                  //);
                },
              ),
              const SizedBox(height: 5,), //sidebox buat jarak antar gambar atau tulisan
              TextButton(
                onPressed:() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => viewLogin()
                      )
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                  "--------------------  or  --------------------"),
              const SizedBox(height: 15,),
              ElevatedButton.icon(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => viewSignup()
                    )
                );
              },
                  icon: Image.network("https://clipartspub.com/images/facebook-logo-clipart-vector-8.png",
                    width: 35,
                    height: 35,
                  ),
                  label: Text("Sign Up with Facebook"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                    side: BorderSide(color: Colors.lightBlue, width: 1),
                    minimumSize: Size(330,50),//elevated btton background color
                  )
              ),
              const SizedBox(height: 15,),
              ElevatedButton.icon(onPressed: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => viewSignup()
                    )
                );
              },
                  icon: Image.network("https://www.raqnbeauty.com/wp-content/uploads/2020/06/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png",
                    width: 25,
                    height: 25,
                  ),
                  label: Text("Sign Up with Google"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.blueAccent,
                    side: BorderSide(color: Colors.lightBlue, width: 1),
                    minimumSize: Size(330,50),//elevated btton background color
                  )
              ),
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => viewSignup()));
                  },
                    child: Text("Sign up", style: TextStyle(color: Colors.blue),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

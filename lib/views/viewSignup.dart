import 'package:aplikasiqu/views/newLogin.dart';
import 'package:aplikasiqu/views/viewLogin.dart';
import 'package:aplikasiqu/views/viewLoginn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/home.dart';

class viewSignup extends StatefulWidget {
  const viewSignup({Key? key}) : super(key: key);

  @override
  State<viewSignup> createState() => _viewSignupState();
}

class _viewSignupState extends State<viewSignup> {

  bool checkedValue = false;
  String _selectedGender = '';
  List<String> dropdownList = ["SMP","SMA","Diploma1","Diploma3","Diploma4","Strata1","Strata2","Strata3"];
  var selectedDropDown;

  final _formKey = GlobalKey<FormState>();
  var fullname = new TextEditingController();
  var email = new TextEditingController();
  var password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //menghilangkan yellow cross
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://th.bing.com/th/id/R.616f49b0f9e456cd455dee007d71d8a2?rik=8RC5fdMDKS2nBQ&riu=http%3a%2f%2fwww.pngpix.com%2fwp-content%2fuploads%2f2016%2f10%2fPNGPIX-COM-Panda-Vector-PNG-Transparent-Image.png&ehk=djwQJyPBtT6qxD2qF8Co4Y%2faorba2GYyETczS4AamaU%3d&risl=&pid=ImgRaw&r=0",
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    labelText: "Nama",
                    hintText: "",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Silahkan pilih jenis kelamin :"),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: (value){
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              title: const Text('Male'),
                            ),
                        ),
                        Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (value){
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              title: const Text('Female'),
                            ),
                        ),
                      ],
                    )
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text("Silahkan pilih jenis kelamin :"),
                //     ListTile(
                //       leading: Radio<String>(
                //         value: 'Male',
                //         groupValue: _selectedGender,
                //         onChanged: (value){
                //           setState(() {
                //             _selectedGender = value!;
                //           });
                //         },
                //       ),
                //       title: const Text('Male'),
                //     ),
                //     ListTile(
                //       leading: Radio<String>(
                //         value: 'Female',
                //         groupValue: _selectedGender,
                //         onChanged: (value){
                //           setState(() {
                //             _selectedGender = value!;
                //           });
                //         },
                //       ),
                //       title: const Text('Female'),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pendidikan terakhir :"),
                    DropdownButton(
                      isExpanded: true,
                      hint: Text("Silahkan pilih pendidikan terakhir"),
                      value: selectedDropDown,
                      onChanged: (newValue){
                        setState(() {
                          print(newValue.toString());
                          selectedDropDown = newValue;
                        });
                      },
                      items: dropdownList.map((String value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                CheckboxListTile(
                  title: Text("Dengan mendaftar, saya menyetujui Syarat dan Ketentuan serta Kebijakan Privasi.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  value: checkedValue,
                  onChanged: (newValue){
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 15,),
                ElevatedButton(
                  child: Text("Sign Up"),
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => viewLoginn()
                        //     )
                        // );
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('SELAMAT'),
                              content: Text('Pendaftaran anda telah berhasil.'),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) => viewLoginn()
                                        )
                                    );
                                  },
                                ),
                              ],
                            )
                        );
                        print("nama " + fullname.text);
                        print("email " + email.text);
                        print("password " + password.text);
                        print("radiobutton " + _selectedGender.toString());
                        print("dropdownlist" + selectedDropDown.toString());
                        print("checkbox " + checkedValue.toString());

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
                  },
                ),
                const SizedBox(height: 15,), //sidebox buat jarak antar gambar atau tulisan
                Row(
                  children: [
                    Expanded(
                        child: Divider(thickness: 2, color: Colors.black38,)
                    ),
                    const SizedBox(width: 10,),
                    Text("or"),
                    const SizedBox(width: 10,),
                    Expanded(
                        child: Divider(thickness: 2, color: Colors.black38,)
                    ),
                  ],
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
                const SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By signing up you accept the"),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => viewLogin()));
                        },
                          child: Text("Terms of Service", style: TextStyle(color: Colors.blue),),
                        ),
                        Text("and"),
                      ],
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => viewLogin()));
                    },
                      child: Text("Privacy Policy", style: TextStyle(color: Colors.blue),),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => newLogin()));
                    },
                      child: Text("Sign In", style: TextStyle(color: Colors.blue),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

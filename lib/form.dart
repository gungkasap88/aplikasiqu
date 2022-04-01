import 'package:flutter/material.dart';

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {

  final _formKey = GlobalKey<FormState>();
  var textController = new TextEditingController();
  var text2Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Android"),
        ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: textController,
                decoration: new InputDecoration(
                    hintText: "Contoh: xxx",
                    labelText: "Text 1",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Data text 1 tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: text2Controller,
                decoration: new InputDecoration(
                    hintText: "Contoh: zzz",
                    labelText: "Text 2",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Data text 2 tidak boleh kosong";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
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
                  },
                  child: Text('Submit'),
                ),
              )

            ],
          ),
        ),

      ),
    );

  }
}

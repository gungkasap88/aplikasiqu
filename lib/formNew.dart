import 'package:flutter/material.dart';

class formNew extends StatefulWidget {
  const formNew({Key? key}) : super(key: key);

  @override
  State<formNew> createState() => _formNewState();
}

class _formNewState extends State<formNew> {

  bool checkedValue = false;
  String _selectedGender = 'Male';
  List<String> dropdownList = ["Senin","Selasa","Rabu","Kamis","Jumat","Sabtu","Minggu"];
  var selectedDropDown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Contoh Checkbox"),
            CheckboxListTile(
                title: Text("Setuju"),
                value: checkedValue,
                onChanged: (newValue){
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(height: 16,),
            Text("Contoh Radio Button"),
            ListTile(
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
            ListTile(
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
            Text("Contoh Dropdown"),
            DropdownButton(
              isExpanded: true,
              hint: Text("Silahkan pilih hari"),
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
      ),
    );
  }
}

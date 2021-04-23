import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Stateful widget App",
    home: FavouriteCity(),
  ));
}

class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavouriteCityState();
  }
}

class _FavouriteCityState extends State<FavouriteCity> {
  String name = "";
  var _currencies = ["Rupee", "Dollar", "Pound", "Other"];
  var _currentvalue = "Rupee";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful App example")),
      body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onChanged: (String userinput) {
                  setState(() {
                    name = userinput;
                  });
                },
              ),
              DropdownButton(
                items: _currencies.map((String dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newvalue) {
                  _dropdownchanged(newvalue);
                },
                value: _currentvalue,
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text("Your city is $name "),
              )
            ],
          )),
    );
  }

  void _dropdownchanged(newvalue) {
    setState(() {
      this._currentvalue = newvalue;
    });
  }
}

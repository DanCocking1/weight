import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double weightConversion = 0.0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;
      if(value==0){
        weightConversion = 0.06;
        _finalResult = calculateWeight(_weightController.text, weightConversion);
        _formattedText = "Your Weight on Pluto is ${_finalResult.toStringAsFixed(2)}";
      }else if (value==1){
        weightConversion = 0.38;
        _finalResult = calculateWeight(_weightController.text, weightConversion);
        _formattedText = "Your Weight on Mars is ${_finalResult.toStringAsFixed(2)}";
      }else{
        weightConversion = 0.91;
        _finalResult = calculateWeight(_weightController.text, weightConversion);
        _formattedText = "Your Weight on Venus is ${_finalResult.toStringAsFixed(2)}";
      }

     // print(radioValue);


    });



}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
         backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png',
            height: 133.0,
            width: 200.0,),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'in Lbs',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.brown),
                      ),
                      new Radio<int>(
                        activeColor: Colors.red,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.redAccent),
                      ),
                      new Radio<int>(
                        activeColor: Colors.white,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //Result Text
                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight." : _formattedText + " .lbs",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500,
                        )
                  ),
                ],
              ),

            )

          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double weightConversion) {

    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * weightConversion;
    }else{
      print("Wrong!");
      return 180.7;
    }
  }
}
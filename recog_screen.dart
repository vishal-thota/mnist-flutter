import 'dart:ui';
import 'package:flutter/material.dart';
import 'detect.dart';
import 'dart:ui' hide Image;
import 'customPainter.dart';
import 'loginscreen.dart';


class RecogScreen extends StatefulWidget {
  @override
  _RecogScreenState createState() => _RecogScreenState();
}

class _RecogScreenState extends State<RecogScreen> {
  static var emptyPredictions = List.generate(9, (_) => 0.0);

final predictclass = Predictor();
List preds = List();
List<Offset> offsetpoints = List();
bool predictpressed = false;

@override
void initState() {
  super.initState();
  predictclass.loadModel();
}
// 
@override
Widget build(BuildContext context){
  return Scaffold(
  body:Container(
  decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue[400],
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.3, 0.8, 1],
                  ),
                ),
  child: ListView(
    children: <Widget>[
      backbutton(),
      titleText(),
      SizedBox(height: 10),
      drawBox(),
      SizedBox(height: 10),
      buttons(),
      FittedBox(
        alignment: Alignment.center,
        child: textOutput(), ),
      
    ],
  ),
  
  ));
  }
Widget drawBox() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(
          width: 4.0,
          color: Colors.yellow,
        ),
      ),
      child:  getcanvas(),
      );
  }
Widget getcanvas(){
  return 
    Builder(
        builder: (BuildContext context)=> 
         GestureDetector(
          onPanUpdate: (details) {
                          setState(() {
                            RenderBox renderBox = context.findRenderObject();
                            offsetpoints.add(renderBox
                                .globalToLocal(details.globalPosition));
                          });
                        },
                        onPanStart: (details) {
                          setState(() {
                            RenderBox renderBox = context.findRenderObject();
                            offsetpoints.add(renderBox
                                .globalToLocal(details.globalPosition));
                          });
                        },
                        onPanEnd: (details) async {
                          offsetpoints.add(null);
                          preds = await predictclass.processPoints(offsetpoints);
                          print(preds[0]["confidence"]);
                          setState(() {});
                        },
        
          child: ClipRect(
            child: CustomPaint(
              size: Size(250,250),
              painter: DrawingPainter(offpoints: offsetpoints),
              ),
            ),
          ),
        );
}
Widget buttons(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 120,
      child: RaisedButton( 
        onPressed: _clearcanvas,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'CLEAR',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans',
          ),
        ),
      ),
    ),
     Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 120,
      child: RaisedButton( 
        onPressed: ()  {
          setState(() {
            predictpressed= true;
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'PREDICT',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans',
          ),
        ),
      ),
    )


  ],);
}
void _clearcanvas(){
    offsetpoints.clear();
    setState(() {
      predictpressed = false;
    });

}
Widget backbutton(){
  return 
  Container(alignment: Alignment.topLeft ,
  child: BackButton(
      color: Colors.white,
      onPressed: (){
          Navigator.pop(context);

      },

  ),);

}

Widget titleText(){
  return 

        Container (
        margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
        alignment: Alignment.topCenter,
        child: Text(
                        'Classify',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontFamily: 'proto',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),       
      );
}
Widget textOutput(){
  return Container(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.all(25),
    height: 150.0,
    child: predictpressed ? Text("The number is " + preds.toString(), style: TextStyle(
      fontFamily: 'inknut',
      fontSize: 40,  
    )): SizedBox(height:100)
  );
  }
  


      
}



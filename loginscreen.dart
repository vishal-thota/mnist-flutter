import 'dart:ui';

import 'package:digitpaint/recog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
bool _isButtonEnabled=false;
var _formkey = GlobalKey<FormState>(); 

bool changeback = false;
// int count=0;
// 
final redbut =Color(0xFF86a6df);
final bluebut =Color(0xffe77c7c);
bool backcolor = true;
// 0xfffe5f55
final String username = "vishalthota";
final String key = "keertana";
final redboxDecorationStyle = BoxDecoration(
  color: Color(0xffda4949), 
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final blueboxDecorationStyle = BoxDecoration(
  color: Color(0xff0096fe), 
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final buttonstyle = TextStyle(
  color: Colors.white,
  fontFamily: 'opensans',
  fontWeight: FontWeight.bold,
);
   
     
  


Widget _logoandinfo(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          
          Text(
                        'Recogn1ze',
                      textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontFamily: 'proto',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

          IconButton(
            iconSize: 30,
            icon: Icon(Icons.info_outline,
            color: Colors.white),
             onPressed: _showinfo)


        ],


      );}

void  _showinfo() {
  showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Color(0xff161616),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)), //this right here
            child: Container(
              width: 250,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: 
                  Container(
                    child:
                    Image.asset('assets/dback1.jpg'),
                  ),
                   
                  
                
              ),
            )
          );
        });
}
Widget _buildEmail(){
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.white,fontFamily: 'opensans'),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: backcolor? redboxDecorationStyle: blueboxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
               fontFamily: 'opensans',
            
             ),
             decoration: InputDecoration(
              border: InputBorder.none,
              errorStyle: TextStyle(
                color: Colors.yellow,
                fontSize: 10,
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: buttonstyle,
            ),
            validator: (String value){
              if ( value != username ){
                return "Incorrect USername";
              }
            },
          
            ),
        ),
      ],
    );
    }

  



  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(color: Colors.white,fontFamily: 'opensans'),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: backcolor? redboxDecorationStyle: blueboxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
               fontFamily: 'opensans',
            
             ),
             decoration: InputDecoration(
              border: InputBorder.none,
              errorStyle: TextStyle(
                color: Colors.yellow,
                fontSize: 10,
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: buttonstyle,
            ),
            validator: (String value){
              if ( value != key ){
                return "Incorrect Password";
              }
            },
          
            ),
        ),
      ],
    );
    }

  


  
  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: _errordialog,
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: buttonstyle,
        ),
      ),
    );
  }

// bool _loginok(){
//   if( (checkpassword.text == username) && (checkpassword.text == key)){
//     setState(() {
//      _isButtonEnabled = true;
//     });
//   }
//   return _isButtonEnabled;
// }

void _logok(){
  setState(() {
    if( _formkey.currentState.validate()){
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecogScreen(),));
    }
  });
}

  Widget _buildloginbtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: 200,
      child: RaisedButton( 
        onPressed: _logok,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.blue[700],
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans',
          ),
        ),
      ),
    );
  }

  

  List<bool> _selection = [true, false];
  Widget _togglebutton(){
    return Container(alignment: Alignment.center,
            height: 100,
            child: Column(
            children: <Widget>[
            Text(
              "Select Theme",
              style: TextStyle(fontFamily: 'inknut', fontSize:20, color: Colors.white )),
            ToggleButtons(
              borderColor: Colors.white,
              borderWidth: 3,
              highlightColor: Colors.red,
              fillColor: Colors.white,
              borderRadius: BorderRadius.circular(30),
              selectedBorderColor: Colors.white,
              children: [ 
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '红色',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '蓝色',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ],
                  isSelected: _selection,
                  onPressed: (int index) {
                        setState(() {
                        for (int buttonIndex = 0; buttonIndex < _selection.length; buttonIndex++) {
                       if (buttonIndex == index) {
                       _selection[buttonIndex] = !_selection[buttonIndex];

                  } else {
                   _selection[buttonIndex] = false;
        }
        if (_selection[0]== true){
                backcolor = true;
        }
        else {
            backcolor = false;
        }
      }
    })
    ;
  },
  
              



            ),]),);
            }


  
final blueback=
  BoxDecoration(
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
                );

final redback = 
     BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffa03232),
                      Color(0xffac3f21),
                      Color(0xFFAC3F21),
                      Color(0xffa03232
                      ),
                    ],
                    stops: [0.0, 0.3, 0.7, 1],
                  ),
                );
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formkey,
        child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration:  backcolor ? redback:blueback,
              ),
              Container(
                height: double.infinity,
                //we use singlechildscrollview to enable infinite scroll of our widgets
                //it has physics component to tell the type of physics the user will scroll
                //in case the keyboard pops up and blocks the info(here the login button)
                //so basically this child lets us scroll the widgets always
                child: SingleChildScrollView(
                  //always scrollable just lets the user scroll
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 100.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     _logoandinfo(),
                     // sized box adds an empty box of certain height
                     
                      SizedBox(height: 30.0),
                      _buildEmail(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPassword(),
                      _buildForgotPassword(),
                      _buildloginbtn(),
                      SizedBox(height: 10),
                      _togglebutton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );


}

//

final _url = 'https://www.google.com/search?q=noob+get+rekt&sxsrf=ALeKk02f21_k5lHu1KqVQWHEdETTFkrwjw:1590999013246&source=lnms&tbm=isch&sa=X&ved=2ahUKEwisyJaYleDpAhUQzjgGHR47CYgQ_AUoAXoECA0QAw&biw=1366&bih=629';
_launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
void  _errordialog() {
  showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Color(0xff161616),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)), //this right here
            child: Container(
              width: 250,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                    child:
                    Image.asset('assets/loading1.gif'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                     Container(
                      padding: EdgeInsets.all(15),
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.of(context).pop();


                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Try Again",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: RaisedButton(
                        onPressed: (){
                          _launchURL();
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Reset",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],)
                   
                  ],
                ),
              ),
            ),
          );
        });
}

// Widget getinfoDialog(){
//   return Container(
//     height: 200,
//     width: 300,
//     child: Padding(padding: const EdgeInsets.all(30),
//         child: Container(
//           alignment: Alignment.center,
//           child: Image.asset("assets/dback1.jpg")
//           ),
          
    
    
    
    
//     ),
//   );

// }


}






   
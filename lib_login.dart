import 'package:flutter/material.dart';
import 'package:flutter_app/helper/helper.dart';
import 'main.dart';


class Login extends StatelessWidget{

  final _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Creating Circular Widget for profile logo.
    final loginLogo = CircleAvatar(

      backgroundColor: Colors.transparent,
      radius: radiusLoginLogo,
      child: appLogo,
    );

    // Creating Text widget for showing pin text.
    final pinText = Text('PIN',textAlign: TextAlign.left,style: TextStyle(color: Colors.white),);
    // Creating Text Form Field widget for entering PIN.
    final pinCode = TextFormField(

      keyboardType: TextInputType.number,
      autofocus: true,
      maxLines: 1,
      maxLength: 4,
      textAlign: TextAlign.center,
      controller: _pinCodeController,
      decoration: InputDecoration(
        hintText: pinEditTextHint,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),)
      ),
      style: TextStyle(color: Colors.white),

    );
    // Creating Padding widget for including login button widget.
    final loginButton = Padding(

    padding: EdgeInsets.symmetric(vertical: 16.0),

    child: RaisedButton(onPressed: () {

      if (_pinCodeController.text.isEmpty ||_pinCodeController.text.startsWith(" ")) {

        return showDialog(context: context,builder: (context){

          return AlertDialog(

            title: Text('Alert',style: TextStyle(color: Colors.blue),),
            content: Text('Please provide a valid PIN!'),
            actions: <Widget>[FlatButton(
              child: Text('OK',style: TextStyle(color: Colors.blue),),
              onPressed: (){

                Navigator.of(context).pop();
              },
            ),],
          );
        });

      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHome()));
      }
    },

    padding: EdgeInsets.all(12.0),
    color: Colors.blueAccent,
    child: Text(loginButtonText,style: TextStyle(color: Colors.white),),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24)
    ),));

// Creating Text Widget for showing forgot password text.
    final forgotPwdText = Text(
      'Forgot Password?',
      style: TextStyle(color: Colors.white,fontSize: 15.0,),
      textAlign: TextAlign.center,);
// Creating Text widget for showing Text Widget for showing Sign Up
    final signUpText = Text(
      'Sign Up',style: TextStyle(color: Colors.white),
      textAlign: TextAlign.right,
    );


    final testText1 = Align(
      alignment: Alignment.centerLeft,
     // padding: EdgeInsets.all(20.0),
      child: Text("Don't have an account?",style: TextStyle(color: Colors.white,),),
    );

    final testText2 = Align(

      alignment: Alignment.centerRight,
      //padding: EdgeInsets.all(20.0),
      child: Text('Sign up',style: TextStyle(color: Colors.blue),),
    );

    final testContainer = Container(

      padding: EdgeInsets.only(left:85.0,top: 10.0),
      alignment: Alignment.center,
      child: Row(

        children: <Widget>[

          testText1,
          testText2,
        ],
      ),
    );

    return Scaffold(

      backgroundColor: Colors.black,
      body: Center(
 // Adding all widgets created to a list view widget for displaying.
        child: ListView(

          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0,right: 24.0,),
          children: <Widget>[

            loginLogo,
            SizedBox(height: radiusLoginLogo,),

            //pinText,

            pinCode,
            SizedBox(height: buttonHeight,),

            loginButton,
            forgotPwdText,

            Align(

              alignment: Alignment.center,
              child: testContainer,
            ),
            //testContainer,

          ],
        ),
      ),
    );
  }


}

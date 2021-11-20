import 'package:e_library_flutter/authentication/register.dart';
import 'package:e_library_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  final AuthService _authService= AuthService();


  String mail;
  String password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Log in'),
      actions: <Widget>[
        ElevatedButton.icon(
          icon: Icon(Icons.account_box_outlined, color: Colors.white,),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Register();
            }));
          },
          label: Text('Register'),
        )
      ],
      ),
      body: Container(
        child:Padding(
    padding: EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail_outline, color: Colors.white),
                  labelText: 'Email *'
                ),
                onChanged: (val){
                  setState(() {
                    mail = val;
                  }
                  );
                },
                validator: (val){
                  String  pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(val)?null:'Email is incorrect';
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,

                    icon: Icon(Icons.vpn_key, color: Colors.white,),
                    labelText: 'Password *'
                ),
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
                validator: (val)=>val.length<8?'Password is too short':null ,
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text('Log in'),
                onPressed: ()async{
                  if(_formKey.currentState.validate()){
                    dynamic res =await _authService.login( mail, password);
                    if(res==null){
                      Toast.show("Login unsuccessful", context, gravity: Toast.CENTER);

                    }
                    else{

                      _formKey.currentState?.reset();
                    }
                  }
                },
              )
            ],
          ),

        )


      ),
      ),
    );
  }
}

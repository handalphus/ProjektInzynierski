import 'package:e_library_flutter/authentication/signIn.dart';
import 'package:e_library_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  final AuthService _authService= AuthService();

  String name;
  String mail;
  String password;
  String repeatedPassword;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Register'),
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.account_box_outlined, color: Colors.white,),
            onPressed:(){
              Navigator.pop(context);
            },
            label: Text('Login'),
          )
        ],

      ),
      body: Container(

          child:Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
           child:Column(
              children: [

                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    labelText: 'Name *',

                  ),
                  onChanged: (val){
                    setState(() {
                      name = val;
                    }
                    );
                  },
                  validator: (val)=>val.length>0?null:"Name is too short",
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email_outlined, color: Colors.white),
                      labelText: 'Email *',

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
                  validator: (val){
                    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = new RegExp(pattern);
                    return regExp.hasMatch(val)?null:'Password too weak';
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,

                      icon: Icon(Icons.vpn_key, color: Colors.white,),
                      labelText: 'Repeat password *'
                  ),
                  onChanged: (val){
                    setState(() {
                      repeatedPassword = val;
                    });
                  },
                  validator: (val){
                    if(val == password) {
                      return null;
                    }
                    else {
                      return "Passwords don't match";
                    }
                    },
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  child: Text('Register'),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      dynamic res =await _authService.register( mail, password,name);
                      if(res==null){
                        Toast.show("Register unsuccessful", context, gravity: Toast.CENTER);

                      }
                      else{
                        Toast.show("Register successful", context, gravity: Toast.CENTER);
                        _formKey.currentState?.reset();
                      }
                    }
                  },
                )
              ],
            ),
            ),
            ),
          ),
      )



    );
  }
}

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fullNameController;
  TextEditingController usernameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  bool _obscureText = true;
  bool checkedValue = false;
  
  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:20),),
            TextField(
              controller: fullNameController,
              style: TextStyle(
                fontSize: 16.0,
                height: 0.9
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                labelText: 'Nama Lengkap',
                prefixIcon: Icon(Icons.perm_identity),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20),),
            TextField(
              controller: usernameController,
              style: TextStyle(
                fontSize: 16.0,
                height: 0.9
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20),),
            TextField(
              controller: emailController,
              style: TextStyle(
                fontSize: 16.0,
                height: 0.9
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                labelText: 'E-Mail',
                prefixIcon: Icon(Icons.mail),
              ),
            ),            
            Padding(padding: EdgeInsets.only(top:20),),
            TextField(
              obscureText: _obscureText,
              controller: passwordController,
              style: TextStyle(
                fontSize: 16.0,
                height: 0.9
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon:Icon(_obscureText?Icons.visibility_off:Icons.visibility),
                      onPressed: _toggle,
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:20),),
            TextField(
              obscureText: _obscureText,
              controller: confirmPasswordController,
              style: TextStyle(
                fontSize: 16.0,
                height: 0.9
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.indigo)),
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.refresh),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon:Icon(_obscureText?Icons.visibility_off:Icons.visibility),
                      onPressed: _toggle,
                    )
                  ],
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top:10),),

            CheckboxListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Saya Setuju dengan'),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> SnK())),
                    child: Text(
                      'Syarat dan Ketentuan yang Berlaku',
                      style: TextStyle(
                        color: Colors.lightBlue
                      ),
                    ),
                  )
                ],
              ),
              value: checkedValue,
              checkColor: Colors.white,
              activeColor: Colors.indigo,
              onChanged: (bool newValue) { 
                 setState(() {
                   checkedValue = newValue; 
                 }); 
               },
              controlAffinity: ListTileControlAffinity.leading,

            ),

            Padding(padding: EdgeInsets.only(top:10),),

            ButtonTheme(
              minWidth: 900,
              child: FlatButton(
                onPressed: (){},
                textColor: Colors.indigo,
                padding: EdgeInsets.all(5.0),
                child: Text('Register',style:TextStyle(fontSize: 18.0)),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.white)
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

class SnK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Syarat & Ketentuan'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Text('Snk')
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var nameText = TextEditingController();
  var phoneText = TextEditingController();
  var emailText = TextEditingController();
  var passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: Text(
                    'Login Form',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          width: 300,
                          child: TextFormField(
                            controller: nameText,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Enter Your Name',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              if (value.length < 3) {
                                return 'Name must be at least 3 characters long';
                              }
                              // Add any other validation rules you need
                              return null;
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: 300,
                          child: TextField(
                            controller: phoneText,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Enter Your phoneNumber',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: 300,
                          child: TextField(
                            controller: emailText,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Enter Your Email ID',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: 300,
                          child: TextField(
                            controller: passwordText,
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              hintText: 'Enter Your password',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          storeData(nameText.text,phoneText.text,emailText.text,passwordText.text);
                          /*
                          String Uname = nameText.text;
                          String Uphone = phoneText.text;
                          String Uemail = emailText.text;
                          String Upassword = passwordText.text;
                          print(
                              'Name=$Uname,PhoneNo=$Uphone,Email ID=$Uemail,Password=$Upassword');
                              */
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          width: 200,
                          color: Colors.green,
                          child: Center(
                              child: Text(
                            'Login Here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void storeData(name,phoneno,email,password) {
  final box = GetStorage();
  box.write('Name',name);
  box.write('PhoneNo',phoneno);
  box.write('Email',email);
  box.write('password',password);
  print('Name:$name');
  print('PhoneNo:$phoneno');
  print('Email:$email');
  print('Password:$password');
  retrieveData();

}

void retrieveData() {
  final box = GetStorage();
  final name = box.read('Name');
  final phoneno= box.read('PhoneNo');
  final email = box.read('Email');
  final password=box.read('Password');
  print('Name: $name');
  print('PhoneNo: $phoneno');
  print('Email: $email');
  print('Password:$password');
}
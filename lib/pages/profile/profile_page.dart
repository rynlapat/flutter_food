import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset('assets/images/bg003.jpg'),
                  )
              ),

              Text(
                'Rynlapat Khongsirikul',
                style: TextStyle(fontSize: 30.0, color: Colors.grey.shade700,fontWeight: FontWeight.bold),
              ),
              Text(
                'rynlapat@gmail.com',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ],


          ),
        ),
      ),
    );
  }
}
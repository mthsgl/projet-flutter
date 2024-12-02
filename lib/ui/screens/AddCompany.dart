import 'package:flutter/material.dart';

class AddCompany extends StatelessWidget {
  const AddCompany({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(),
              //ElevatedButton(onPressed: , child: child)
            ],
          ),
        ),
      ),
    );
  }
}

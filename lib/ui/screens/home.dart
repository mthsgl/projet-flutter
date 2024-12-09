import 'package:android_studio/ui/screens/add_company.dart';
import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../models/company.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies =  [
    Company('Guillemot', Address('2 Rue du Chêne Héleuc', 'Carentoir','56910' )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des entreprises'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _companies.length, // à remplacer,
        itemBuilder: (context, index) {
          final company = _companies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ListTile(
                leading: Icon(Icons.business),
                title: Text(company.name),
                subtitle: Text(company.address.toString()),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () async {
          final Company? newCompany = await Navigator.pushNamed(context, '/add_company') as Company;
          if (newCompany != null){
            setState(() {
              _companies.add(newCompany);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



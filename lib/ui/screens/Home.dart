import 'package:android_studio/ui/screens/AddCompany.dart';
import 'package:flutter/material.dart';

import '../../models/Company.dart';

class Home extends StatelessWidget {

  const Home({Key? key}): super(key: key);
  final List<Company> _companies = const [
    Company('Entreprise 1'),
    Company('Entreprise 2'),
    Company('Entreprise 3'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Liste des entreprises'),
        ),
        body: Container(
          child: ListView.separated(
              itemCount: _companies.length, // à remplacer,
              itemBuilder: (context, index) {
                final company = _companies[index];
                return ListTile(
                  title: Text(company.name)
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddCompany())
            );
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}

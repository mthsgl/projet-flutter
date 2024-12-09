import 'package:android_studio/ui/screens/search_address.dart';
import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../models/company.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({super.key});

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  Address? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textFieldController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une entreprise'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                      labelText: "Nom de l'entreprise",
                      prefixIcon: Icon(Icons.business),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Veuillez saisir un nom d\'entreprise';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                    controller: TextEditingController(text: _selectedAddress?.toString()),
                    decoration: InputDecoration(
                        labelText: "Adresse de l'entreprise",
                        prefixIcon: const Icon(Icons.location_on),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Veuillez saisir une adresse !';
                      }
                      return null;
                    },
                    onTap: () async {
                      final result = await Navigator.pushNamed(context, '/search_address');
                      if (result != null) {
                        setState(() {
                          _selectedAddress = result as Address;
                        });
                      }
                    }
                ),

              ),
              ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final String name = _textFieldController.text;
                      final newCompany = Company(name, _selectedAddress!);
                      Navigator.pop(context, newCompany);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Ajouter')
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Get the selected address from the previous screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectedAddress = ModalRoute.of(context)?.settings.arguments as Address?;
      setState(() {}); // Update the UI
    });
  }
}

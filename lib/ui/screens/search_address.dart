import 'package:android_studio/repositories/address__repository.dart';
import 'package:flutter/material.dart';

import '../../models/address.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Address> _addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rechercher une adresse'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Column (
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Rechercher une adresse',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) async {
                  if (query.length >= 3 ){
                    final addressRepository = AddressRepository();
                    final addresses = await addressRepository.fetchAddresses(query);
                    setState(() {
                      _addresses = addresses;
                    });
                  }
                  else {
                    setState(() {
                      _addresses = [];
                    });
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  return ListTile(
                    leading: Icon(Icons.search),
                    title: Text(address.street),
                    subtitle: Text('${address.city}, ${address.postcode}'),
                    onTap: () {
                      Navigator.pop(context, address);
                    },
                  );
                }
              )
            )
          ],
        )
      )
    );
  }
}

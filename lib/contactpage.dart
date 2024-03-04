import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'contacts_helper.dart';

class ContactPage extends StatelessWidget {
  final ThemeData themeData;

  ContactPage({required this.themeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: requestContactPermissionAndGetContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ContactList(contacts: snapshot.data ?? []);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> contacts;

  ContactList({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        var contact = contacts[index];
        return ListTile(
          title: Text(contact.displayName ?? ''),
          subtitle: Text(contact.phones?.isNotEmpty == true ? contact.phones?.first.value ?? '' : ''),
        );
      },
    );
  }
}

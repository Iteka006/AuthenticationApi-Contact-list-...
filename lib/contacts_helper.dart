import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestContactPermission() async {
  var status = await Permission.contacts.request();
  if (status.isGranted) {
    // Permission granted, proceed to access contacts
    getContacts();
  } else {
    // Permission denied
    print('Permission denied');
  }
}

Future<void> getContacts() async {
  Iterable<Contact> contacts = await ContactsService.getContacts();

  // Process the contacts as needed
  for (var contact in contacts) {
    print('Name: ${contact.displayName}, Phone: ${contact.phones}');
  }
}

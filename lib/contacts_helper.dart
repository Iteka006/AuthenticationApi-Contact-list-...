import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<List<Contact>> requestContactPermissionAndGetContacts() async {
  var status = await Permission.contacts.request();
  print('Contact Permission Status: $status');
  if (status.isGranted) {
    return getContacts();
  } else {
    print('Permission denied');
    return [];
  }
}

Future<List<Contact>> getContacts() async {
  print('Getting contacts...');
  Iterable<Contact> contacts = await ContactsService.getContacts();
  print('Contacts retrieved');

  return List<Contact>.from(contacts);
}

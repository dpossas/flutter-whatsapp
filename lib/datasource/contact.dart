import 'package:faker/faker.dart';
import 'package:flutter_whatsapp_gui/model/contact.dart';

class ContactDataSource {
  static List<Contact> fetchContacts({int size = 25}) {
    final _faker = Faker();

    List<Contact> listContact = [];

    for(int i = 0; i < size; i++){
      String firstName = _faker.person.firstName();
      String lastName = _faker.person.lastName();
      String contactName = "$firstName $lastName";
      String initials = "${firstName.substring(0,1)}${lastName.substring(0,1)}";

      listContact.add(Contact(i, firstName, lastName, contactName, initials));
    }

    return listContact;
  }
}
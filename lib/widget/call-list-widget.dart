import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_gui/datasource/contact.dart';
import "dart:math";

import 'package:flutter_whatsapp_gui/model/contact.dart';

class CallListWidget extends StatelessWidget {
  List<Contact> contactCallList = ContactDataSource.fetchContacts(size: 3);
  List<IconData> callIcons = [Icons.call_made, Icons.call_received];
  List<Color> callColors = [Colors.green, Colors.red];
  List<IconData> typeCallList = [Icons.videocam, Icons.phone];

  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          Contact contactCall = contactCallList[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                  contactCall.initials
              ),
            ),
            title: Text(
                contactCall.contactName
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(
                  callIcons[_random.nextInt(callIcons.length)],
                  color: callColors[_random.nextInt(callColors.length)],
                  size: 12,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    "+55 47 9999-9999"
                ),
              ],
            ),
            trailing: Icon(
              typeCallList[_random.nextInt(typeCallList.length)]
            )
          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
        itemCount: contactCallList.length
    );
  }
}

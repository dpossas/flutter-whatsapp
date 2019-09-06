import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_gui/datasource/contact.dart';
import 'package:flutter_whatsapp_gui/model/contact.dart';
import 'package:flutter_whatsapp_gui/widget/chat-individual-widget.dart';

class ChatListWidget extends StatelessWidget {
  List<Contact> contactList = ContactDataSource.fetchContacts();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          Contact contact = contactList[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                contact.initials
              ),
            ),
            title: Text(
              contact.contactName
            ),
            subtitle: Text(
              "Subtitulo"
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("00:00"),
                SizedBox(height: 5,),
                index == 0 ? CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 15,
                  ),
                ) : Icon(Icons.volume_off)
              ],
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_){
                    return ChatIndividualWidget();
                  }
                )
              );
            },
          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
        itemCount: contactList.length
    );
  }
}
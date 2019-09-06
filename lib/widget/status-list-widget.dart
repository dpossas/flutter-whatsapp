import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_gui/datasource/contact.dart';
import 'package:flutter_whatsapp_gui/model/contact.dart';

class StausListWidget extends StatelessWidget {
  final _scrollController = ScrollController();
  List<Contact> contactStatusList = ContactDataSource.fetchContacts(size: 8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Stack(
              children: <Widget>[
                CircleAvatar(
                  child: Text(
                      "DP"
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: RawMaterialButton(
                      elevation: 0,
                      onPressed: (){},
                      child: Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0),
                      fillColor: Colors.green,
                    ),
                  ),
                )
              ],
            ),
            title: Text(
              "Meu status"
            ),
            subtitle: Text(
              "Toque para atualizar seu status"
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            color: Colors.black12,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Atualizações recentes"
                  ),
                )
              ],
            ),
          ),
          ListView.separated(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Contact status = contactStatusList[index];
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 2
                      )
                    ),
                    child: CircleAvatar(
                      child: Text(
                          status.initials
                      ),
                    ),
                  ),
                  title: Text(
                      status.contactName
                  ),
                  subtitle: Text(
                      "Subtitulo"
                  ),
                );
              },
              separatorBuilder: (context, index){
                return Divider();
              },
              itemCount: contactStatusList.length
          )
        ],
      ),
    );
  }
}

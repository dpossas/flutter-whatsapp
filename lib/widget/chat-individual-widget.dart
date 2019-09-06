import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_gui/datasource/message.dart';
import 'package:flutter_whatsapp_gui/model/message.dart';

class ChatIndividualWidget extends StatelessWidget {
  final _messageInputController = TextEditingController();
  final _bgColor = Color.fromRGBO(250, 249, 227, 1);
  final _messageScrollController = ScrollController();
  List<Message> _messages = MessageDataSource.fetchMessages();
  bool lastMessageIsMine = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: _bgColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: _messageInputController,
                    decoration: InputDecoration(
                      filled: true,
                      enabled: true,
                      contentPadding: EdgeInsets.all(10),
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50)
                        ),
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_voice,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            BackButton(),
            CircleAvatar(
              child: Text(
                "CX"
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Contato X",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
                Text(
                  "online agora",
                  style:  TextStyle(
                      color: Colors.white,
                      fontSize: 12
                  ),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.videocam
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.phone
            ),
          ),
          PopupMenuButton(
            icon: Icon(
                Icons.more_vert
            ),
            itemBuilder: (context){
              return _moreMenuOptions();
            },
          ),
        ],
      ),
      body: Container(
        color: _bgColor,
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          controller: _messageScrollController,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index){
            Message message = _messages[index];
            if ( index > 0)
            lastMessageIsMine = _messages[index-1].itsMe;

            return _message(message);
          },
          separatorBuilder:  (context, index){
            return SizedBox(
              height: 4,
            );
          },
          itemCount: _messages.length
        )
      ),
    );
  }

  Widget _message(Message message) {
    return Padding(
      padding: EdgeInsets.only(
        right: message.itsMe ? 10 : 50,
        left: message.itsMe ? 50 : 10,
        top: message.itsMe != lastMessageIsMine ? 10 : 0
      ),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Text(
          message.content
        ),
      ),
    );
  }

  List<PopupMenuItem> _moreMenuOptions() {
    return [
      const PopupMenuItem(
        child: Text(
            "Ver contato"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "Mídia"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "Buscar"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "Silenciar notificações"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "Papel de parede"
        ),
      ),
    ];
  }
}
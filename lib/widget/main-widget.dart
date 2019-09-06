import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_gui/widget/call-list-widget.dart';
import 'package:flutter_whatsapp_gui/widget/chat-list-widget.dart';
import 'package:flutter_whatsapp_gui/widget/status-list-widget.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp"
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.search
            ),
          ),
          PopupMenuButton(
            icon: Icon(
                Icons.more_vert
            ),
            itemBuilder: (context){
              return _moreMenuOptions();
            },
            offset: Offset(0,60),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                    Icons.camera_alt
                ),
              ),
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  labelPadding: EdgeInsets.all(0),
                  tabs: <Widget>[
                    Tab(
                      text: "CONVERSAS",
                    ),
                    Tab(
                      text: "STATUS"
                    ),
                    Tab(
                      text: "CHAMADAS",
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.chat
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ChatListWidget(),
          StausListWidget(),
          CallListWidget()
        ],
      ),
    );
  }

  List<PopupMenuItem> _moreMenuOptions() {
    return [
      const PopupMenuItem(
        child: Text(
            "Novo Grupo"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "Nova Transmissão"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "WhatsApp Web"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "Mensagens Favoritas"
        ),
      ),
      const PopupMenuItem(
        child: Text(
            "Configurações"
        ),
      ),
    ];
  }
}

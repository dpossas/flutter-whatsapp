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
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.more_vert
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: TabBar(
            controller: _tabController,
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
}
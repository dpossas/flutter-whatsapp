import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter_whatsapp_gui/model/message.dart';

class MessageDataSource {
  static List<Message> fetchMessages({int size = 25}) {
    final _faker = Faker();
    final _random = Random();
    List<Message> listMessage = [];

    for(int i = 0; i < size; i++){
      String msg = _faker.lorem.words(_random.nextInt(20)).join(" ");
      bool itsMe = _random.nextBool();

      listMessage.add(Message(i, msg, itsMe));
    }

    return listMessage;
  }
}
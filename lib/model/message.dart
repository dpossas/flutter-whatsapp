class Message {
  int _id;
  String _content;
  bool _itsMe;

  Message(this._id, this._content, this._itsMe);

  bool get itsMe => _itsMe;

  String get content => _content;

  int get id => _id;
}
class Contact {
  int _id;
  String _firstName;
  String _lastName;
  String _contactName;
  String _initials;

  Contact(this._id, this._firstName, this._lastName, this._contactName, this._initials);

  String get initials => _initials;

  String get contactName => _contactName;

  String get lastName => _lastName;

  String get firstName => _firstName;

  int get id => _id;


}
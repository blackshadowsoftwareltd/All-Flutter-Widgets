import 'package:flutter/cupertino.dart';
import 'countries.dart';

class ServiceProvider extends ChangeNotifier {
  String? _phoneNumber;
  String _searchText = '';
  List<Country> _country = List.of(countriesList);
  Country _selected = Country(
      flag: "🇧🇩",
      code: "BD",
      dialCode: "880",
      minLength: 10,
      maxLength: 10,
      name: 'Bangladesh');

  ///
  String? get phoneNumber => _phoneNumber;
  String get searchText => _searchText;
  List<Country> get country => _country;
  Country get selected => _selected;

  ///
  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  void setSelected(Country data) {
    _selected = data;
    notifyListeners();
  }

  void setPhoneNumber(String? text) {
    _phoneNumber = text;
    print(phoneNumber);
    notifyListeners();
  }
}

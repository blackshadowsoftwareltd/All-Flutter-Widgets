import 'package:flutter/cupertino.dart';
import 'package:selectedlist/apis.dart';

import 'model.dart';

class ServicesProvider extends ChangeNotifier {
  Future<bool>? _isLoad = null;
  Future<bool>? get isLoad => _isLoad;
  List<Datum> _districts = [];
  List<Datum> get districts => _districts;
 
  ///
  List<Datum> _selectedDistrict = [];
  List<Datum> get selectedDistrict => _selectedDistrict;

  ///
  String _text = '';
  String get text => _text;

  ///
  void getData() {
    if (_isLoad == null) {
      _isLoad = Apis.data()!.then((value) {
        value.data!
            .map((Datum e) => districts.add(Datum(
                coordinates: e.coordinates,
                id: e.id,
                district: e.district,
                districtbn: e.districtbn)))
            .toList();
        notifyListeners();
        return true;
      });
    }
  }

  void setText(String text) {
    _text = text;
    print(_text);
    notifyListeners();
  }

  void addData(data) {
    _selectedDistrict.add(data);
    notifyListeners();
  }

  void removeData(data) {
    _selectedDistrict.remove(data);
    notifyListeners();
  }

  void removeAll() {
    _selectedDistrict.clear();
    notifyListeners();
  }
}

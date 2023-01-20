import 'package:assessment/model/model.dart';
import 'package:flutter/widgets.dart';
import 'package:assessment/service/api_service.dart';

class UserViewModel extends ChangeNotifier {
  Users? _data;
  Users? get data => _data;

  getData() async {
    final response = await ReqresAPI().fetchData();
    _data = response;
    notifyListeners();
  }
}

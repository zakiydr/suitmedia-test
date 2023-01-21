import 'package:assessment/model/main_data.dart';
import 'package:assessment/model/user_data.dart';
import 'package:flutter/widgets.dart';
import 'package:assessment/service/api_service.dart';

class UserViewModel extends ChangeNotifier {
  Users? _users;
  Users? get data => _users;

  UserData? _dataById;
  UserData? get dataById => _dataById;

  getData(int page) async {
    final response = await ReqresAPI().fetchData(page);
    _users = response;
    notifyListeners();
  }

  getDataById(int id) async {
    final response = await ReqresAPI().fetchDataById(id);
    _dataById = response;
    notifyListeners();
  }
}

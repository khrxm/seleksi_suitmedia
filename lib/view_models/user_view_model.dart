import 'package:flutter/material.dart';
import 'package:seleksi_suitmedia/models/my_model.dart';
import 'package:seleksi_suitmedia/services/my_service.dart';

class UserViewModel with ChangeNotifier{
  List<MyModel> _users = [];
  int _totalPage = 0;
  bool _loading = true;

  List<MyModel> get users => _users;
  int get totalPage => _totalPage;
  bool get loading => _loading;

  set users(List<MyModel> users){
    _users = users;
    notifyListeners();
  }

  set totalPage(int totalPage){
    _totalPage = totalPage;
    notifyListeners();
  }

  set loading(bool loading){
    _loading = loading;
    notifyListeners();
  }

  Future<void> getUsers({int page = 1}) async {
    try {
      loading = false;
      final Map<String, dynamic> result = await MyService().getUsers(page: page);

      if (page > 1) {
        users = [...users, ...result['users']];
      } else {
        users = result['users'];
      }
      totalPage = result['total_pages'];
   
    } catch (e) {
      loading = false;
      print(e);
    }
  }




}

import 'package:flutter/material.dart';
import '../data/response/api_response.dart';
import '../models/users_model.dart';
import '../repository/users_repository_implementation.dart';

class UsersViewModel extends ChangeNotifier
{
  final _myRepo = UsersRepositoryImplementation();
  ApiResponse<List<UserModel>> users = ApiResponse.loading();

  void _setUsers(ApiResponse<List<UserModel>> response)
  {
    users = response;
    notifyListeners();
  }

  Future<void> fetchUsers() async
  {
    _setUsers(ApiResponse.loading());
    _myRepo
        .getUsersList()
        .then((value) => _setUsers(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setUsers(ApiResponse.error(error.toString())));
  }

}

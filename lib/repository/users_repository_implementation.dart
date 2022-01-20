import '../../data/network/api_end_points.dart';
import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../models/users_model.dart';
import 'users_repository.dart';

class UsersRepositoryImplementation implements UsersRepository
{
  final BaseApiService _apiService = NetworkApiService();
  @override
  Future<List<UserModel>> getUsersList() async
  {
    dynamic response = await _apiService.getResponse(ApiEndPoints().getUsers);
    final jsonData = response as List;
    List<UserModel> usersList = jsonData.map((tagJson) => UserModel.fromJson(tagJson)).toList();
    return usersList;
  }

}
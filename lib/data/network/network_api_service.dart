import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../response/app_exception.dart';
import '../network/base_api_service.dart';

class NetworkApiService extends BaseApiService
{

  @override
  Future getResponse(String url) async
  {
    dynamic responseJson;
    try
    {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    }
    on SocketException
    {
      throw FetchDataException('NO INTERNET CONNECTION');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response)
  {
    switch (response.statusCode)
    {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('ERROR OCCURRED WHILE COMMUNICATION WITH SERVER' ' WITH STATUS CODE : ${response.statusCode}');
    }
  }
}
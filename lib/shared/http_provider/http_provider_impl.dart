import 'dart:convert';
import 'dart:io';

import 'package:dadoscovid/shared/errors/http_errors.dart';
import 'package:http/http.dart' as http;

import 'http_provider.dart';

class HttpProviderImpl implements HttpProvider {
  @override
  Future get(String url) async {
    var result;
    try {
      final response = await http.get(Uri.parse(url));
      result = _response(response);
    } on SocketException {
      throw FetchDataException('Sem conexão com a internet');
    } on Exception {
      throw FetchDataException('Erro não identificado');
    }
    return result;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorisedException(response.body);
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
        throw BadRequestException(response.body);
      default:
        throw FetchDataException(
          'Ocorreu um erro durante a comunicação com o servidor',
        );
    }
  }
}

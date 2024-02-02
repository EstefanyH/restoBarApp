import 'dart:convert';
import 'package:http/http.dart';
import 'package:restobarapp/domain/model/user.dart';

class UsuarioInactiveService {
  final String apiUrl;

  UsuarioInactiveService({required this.apiUrl});
  
  get http => null;

  Future<List<Usuario>> fetchItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200){
      Iterable list = json.decode(response.body);
      return list.map((item) => Usuario.fromJson(item)).toList();
    } else {
      throw Exception('Failed to convertion');
    }
  }
}
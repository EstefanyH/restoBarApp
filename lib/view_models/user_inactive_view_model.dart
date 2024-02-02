import 'package:flutter/material.dart';
import 'package:restobarapp/domain/model/user.dart';
import 'package:restobarapp/service/user_inactive_service.dart';

class UsuarioInactivoViewModel extends ChangeNotifier {
  final UsuarioInactiveService _service = UsuarioInactiveService(apiUrl: '');
  List<Usuario> _items = [];
  /*
  final List<Usuario> _items = [
    Usuario(Nombre: 'Ricardo Torres', Hora: '02:30 pm'),
    Usuario(Nombre: 'Ricardo Torres', Hora: '02:30 pm')
  ];*/

  List<Usuario> get items => _items;

  void addItem(Usuario newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  Future<void> fetchItems() async {
    try {
      _items = await _service.fetchItems();
      notifyListeners();
    } catch(e) {
      print('Error fetching item: $e');
    }
  }
}
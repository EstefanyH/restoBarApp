import 'package:flutter/material.dart';
import 'package:restobarapp/model/User.dart';

class UsuarioInactivoViewModel extends ChangeNotifier {
  final List<Usuario> _items = [
    Usuario(Nombre: 'Ricardo Torres', Hora: '02:30 pm'),
    Usuario(Nombre: 'Ricardo Torres', Hora: '02:30 pm')
  ];

  List<Usuario> get items => _items;

  void addItem(Usuario newItem) {
    _items.add(newItem);
    notifyListeners();
  }
}
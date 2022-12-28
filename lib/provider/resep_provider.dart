import 'package:flutter/cupertino.dart';
import 'package:project_akhir/model/list_menu.dart';

class ResepProvider extends ChangeNotifier {
  final _resep = <ResepMenu>[];
  List<ResepMenu> get resep => List.unmodifiable(_resep);

  void addResep(ResepMenu resep) {
    _resep.add(resep);
    notifyListeners();
  }

  void deleteResep(int index, input) {
    _resep[index] = input;
    _resep.removeAt(index);
    notifyListeners();
  }
}

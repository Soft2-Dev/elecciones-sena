import 'package:flutter/cupertino.dart';

class CategoriasFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = new GlobalKey<FormState>();

  String documento = '';

  validateFrom() {
    if (fromkey.currentState.validate()) {
      print('from valid ... login');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}

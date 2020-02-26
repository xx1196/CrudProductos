import 'dart:convert';

import 'package:http/http.dart' as Http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyDVbGMhzimv0qDdsTk3O-tcLK65OI27uCk';

  Future newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await Http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodeResp = jsonDecode(resp.body);

    print(decodeResp);
    
    if (decodeResp.containsKey('idToken')) {
      //TODO: salvar token en el storage
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'message': decodeResp['error']['message']};
    }
  }
}

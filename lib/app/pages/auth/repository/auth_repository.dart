import 'package:greengrocer_mobile/app/contants/endpoints.dart';
import 'package:greengrocer_mobile/app/core/ui/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({
    required String email,
    required String password,
  }) async {
    final result  = await  _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );
    if(result['result'] != null) {
      print('acesso aceito');
      print(result);
    } else {
      print('negado');
      print(result['error']);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:my_test/core/model/login_model.dart';
import 'package:my_test/core/model/mixins/navigation_mixins.dart';
import 'package:my_test/services/api/api_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel with NavigationMixin {
  String? _email;
  String? _password;

  String get email => _email ?? '';
  String get password => _password ?? '';

  LoginRequest get loginRequest => LoginRequest(email: email, password: password);

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

 Future<void> login() async {
  setBusy(true);
  final apiService = ApiService.init(); // ✅ This fixes the base URL issue

  try {
    final response = await runBusyFuture(apiService.logins(loginRequest));

    if (response.statusCode == 200) {
      print("Login Success: ${response.statusMessage}");
      goToDashboard();
    } else {
      print("Login failed: ${response.statusMessage}");
    }
  } catch (e) {
    print("Login error: $e");
  } finally {
    setBusy(false);
  }
}

}

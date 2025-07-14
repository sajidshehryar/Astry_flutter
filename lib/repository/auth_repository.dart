class AuthRepository {
  Future<bool> login({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 2)); // simulate API call
    return username == "admin" && password == "1234"; // mock condition
  }
}

import '../models/user_model.dart';

class AuthRepository {
  UserModel? _currentUser = UserModel(
    userId: 'usr_1001',
    name: 'MD. TANVIR HOSSAIN',
    phone: '+8801700000000',
    email: 'tanvir@railgobd.com',
    nidOrDob: '19952691234567891',
    gender: 'Male',
  );

  UserModel? get currentUser => _currentUser;

  Future<bool> login(String phone, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return true;
  }

  Future<bool> register(
    String name,
    String phone,
    String email,
    String nid,
    String password,
  ) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = UserModel(
      userId: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      phone: phone,
      email: email,
      nidOrDob: nid,
      gender: 'Male',
    );
    return true;
  }

  Future<void> logout() async {
    _currentUser = null;
  }
}

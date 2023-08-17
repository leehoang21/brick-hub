import 'package:injectable/injectable.dart';

import '../storage/local_storage.dart';

@singleton
class AppService {
  late String token;

  onInit() async {
    final LocalStorage storage = LocalStorage();
    token = await storage.token;
  }

  void logout() async {
    final LocalStorage storage = LocalStorage();
    await storage.addToken('');
  }
}

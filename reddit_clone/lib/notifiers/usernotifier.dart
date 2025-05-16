import 'package:reddit_clone/models/usermodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void updateUserName(String username) {
    state = state?.copyWith(name: username);
  }

  void updateUserStatus(bool isActive) {
    state = state?.copyWith(status: isActive);
  }

  void loginUser({
    required String UserName,
    required String UserEmail,
    required String UserPublicUUID,
    required bool UserStatus,
  }) {
    state = User(
      UserName: UserName,
      UserEmail: UserEmail,
      UserPublicUUID: UserPublicUUID,
      UserStatus: UserStatus,
    );
  }

  void logOutUser() {
    state = null;
  }
}

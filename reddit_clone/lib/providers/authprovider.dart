import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/models/usermodel.dart';
import 'package:reddit_clone/notifiers/usernotifier.dart';

final AuthStatusProvider = StateProvider<bool>((ref) {
  return false;
});

final UserNotifierProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});

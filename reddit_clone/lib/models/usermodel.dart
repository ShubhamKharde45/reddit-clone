class User {
  final String UserName;
  final String UserEmail;
  final String UserPublicUUID;
  final bool UserStatus;

  User({
    required this.UserName,
    required this.UserEmail,
    required this.UserPublicUUID,
    required this.UserStatus,
  });

  User copyWith({String? name, String? email, bool? status}) {
    return User(
      UserName: name ?? UserName,
      UserEmail: email ?? UserEmail,
      UserPublicUUID: UserPublicUUID,
      UserStatus: status ?? UserStatus,
    );
  }
}

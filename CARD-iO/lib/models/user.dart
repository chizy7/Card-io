import 'package:meta/meta.dart';

@immutable
class UserId {
  const UserId({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
}

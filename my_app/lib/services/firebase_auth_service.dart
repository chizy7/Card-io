import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserId _userFromFirebase(UserId user) {
    return UserId(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }

  Future signOut() async {
    try {
      return _firebaseAuth.signOut();
    } catch (error) {
      //print(error.toString());
      return null;
    }
  }
}

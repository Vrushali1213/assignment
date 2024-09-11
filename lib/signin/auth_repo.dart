import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAuthentication? _googleAuth;
  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      _googleAuth = await _googleUser?.authentication;
      final _credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth?.accessToken,
        idToken: _googleAuth?.idToken,
      );
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(_credential);

      return userCredential.user!;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

}
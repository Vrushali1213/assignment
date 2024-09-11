import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobportal/routes/app_routes.dart';
import 'package:jobportal/signin/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  User? user;
  AuthRepo _repo = AuthRepo();
  bool isLodingState = false;
  handleGoogleSignin() async {
    isLodingState = true;
    update();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      user = await _repo.signInWithGoogle();
      isLodingState = false;
      print(" user displayname ${user!.displayName}");

      update();
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: "Google sign in failed",
        message: e.toString(),
      ));
    }

    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);

      if (result != null) {

        print("result.user ${result.user!.displayName}");

        await prefs.setString('userId', '${result.user!.displayName}');

      }

      Get.toNamed(AppRoutes.DASHBOARD);

    }
  }

}
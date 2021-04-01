import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/homepage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
final Firestore _db = Firestore.instance;

Future<FirebaseUser> signInWithGoogle() async{
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

  final AuthResult  authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken()!= null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}


// class Authentication {
//   static Future<FirebaseApp> initializeFirebase({
//     required BuildContext context,
//   }) async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//
//     User? user = FirebaseAuth.instance.currentUser;
//
//     if (user != null) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(),
//           ),
//         );
//
//     }
//
//     return firebaseApp;
//   }
//
//
// class Authentication {
//   static Future<User?> signInWithGoogle({required BuildContext context}) async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   User? user;
//
//   if (kIsWeb) {
//   GoogleAuthProvider authProvider = GoogleAuthProvider();
//
//   try {
//   final UserCredential userCredential =
//   await auth.signInWithPopup(authProvider);
//
//   user = userCredential.user;
//   } catch (e) {
//   print(e);
//   }
//   } else {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   final GoogleSignInAccount? googleSignInAccount =
//   await googleSignIn.signIn();
//
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       try {
//         final UserCredential userCredential =
//         await auth.signInWithCredential(credential);
//
//         user = userCredential.user;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             Authentication.customSnackBar(
//               content:
//               'The account already exists with a different credential.',
//             ),
//           );
//         } else if (e.code == 'invalid-credential') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             Authentication.customSnackBar(
//               content:
//               'Error occurred while accessing credentials. Try again.',
//             ),
//           );
//         }
//       } catch (e) {
//   ScaffoldMessenger.of(context).showSnackBar(
//   Authentication.customSnackBar(
//   content: 'Error occurred using Google Sign-In. Try again.',
//   ),
//   );
//   }}}}}
//
//
//   class Authentication {
//   static Future<void> signOut({required BuildContext context}) async {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   try {
//   if (!kIsWeb) {
//   await googleSignIn.signOut();
//   }
//   await FirebaseAuth.instance.signOut();
//   } catch (e) {
//   ScaffoldMessenger.of(context).showSnackBar(
//   Authentication.customSnackBar(
//   content: 'Error signing out. Try again.',
//   ),
//   );
//   }
//   }
//   }
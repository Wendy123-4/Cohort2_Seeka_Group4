import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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


// Getting the User ID
Future<String> getCurrentUserId() async{
  return (await _auth.currentUser()).uid;

}



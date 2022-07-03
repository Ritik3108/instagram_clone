import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


//signup
  Future<String> signUpUser(
      {String email, 
      String password,
       String username, 
       String bio,
       Uint8List file}) async {
    String res = "some error occured";
    print("object$res");
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty||file!=null) {
        //register user
        print('"ieeubvuh"');


     String photoUrl=await   StorageMethods().uploadImageToStorage('profilePics', file, false);
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //add user to our database
        print('"iubvuh"');
        await _firestore.collection('users').doc(cred.user.uid).set({
          "uid": cred.user.uid,
          "email": email,
          "username": username,
          "bio": bio,
          "followers": [],
          "following": [],
          "photoUrl":photoUrl,
        });

        //

        //  await _firestore.collection('users').add({
        //   "uid": cred.user.uid,
        //   "email": email,
        //   "username": username,
        //   "bio":bio,
        //   "followers":[],
        //   "following":[]
        // });

        res = 'Success';
      } 
    }on FirebaseAuthException catch(exp){
      if(exp.code=='invalid-email')
      {
        res='The email is badly formatted.';
      }
      else if(exp.code=='weak-password')
      {
        res='Password should be atleat 6 characters.';
      }
    }
    catch (err) {
      print("objecttry");
      res = err.toString();
    }
    print(res);
    return res;
  }

  //login

  Future<String> loginUser({String email,String password})async
  {
    String res='Some error occured';

    try{
      if(email.isNotEmpty ||password.isNotEmpty)
      {
       await _auth.signInWithEmailAndPassword(email: email, password: password);
        res='Success';

      }else{
        res='Please enter all the fields';
      }
    }
    catch(e)
    {res=e.toString();

    }
    return res;
  }
}

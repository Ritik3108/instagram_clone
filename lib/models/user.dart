import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;

  final String photoUrl;

  final String username;

  final String bio;

  final List followers;
  final List following;

  User(
      {this.bio,
      this.email,
      this.followers,
      this.following,
      this.photoUrl,
      this.uid,
      this.username});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "username": username,
        "bio": bio,
        "followers": followers,
        "following": following,
        "photoUrl": photoUrl,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        bio: snapshot['bio'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        email: snapshot['email'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photoUrl: snapshot['photoUrl']);
  }
}

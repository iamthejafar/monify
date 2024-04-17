import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monify/src/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserCredential> login(
      {required String email, required String password});

  Future<UserCredential> signUp(
      {required String email, required String password, required String name});

  Future<UserModel> getUser(
      {required String uid});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  FirebaseAuth firebaseAuth;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');
  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? "an unexpected  error occurred");
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<UserCredential> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
          uid: userCredential.user!.uid,
          about: "",
          name: name,
          email: email,
          profilePicUrl: "",
          totalBalance: 0,
          income: 0,
          expense: 0);

      await _usersCollection.doc(userModel.uid).set(userModel.toJson());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? "an unexpected  error occurred");
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<UserModel> getUser({required String uid}) async {
    try {
      final userDoc = await _usersCollection.doc(uid).get();
      if (userDoc.exists) {
        return UserModel.fromSnapshot(userDoc);
      } else {
        return Future.error("User not found");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}



import 'package:firebase_auth/firebase_auth.dart';
import 'package:monify/src/comman/error/execptions.dart';


abstract interface class AuthApiService {

  Future <UserCredential> login({required String email, required String password});

  Future <UserCredential> signUp({required String email, required String password});

}


class AuthApiServiceImpl implements AuthApiService {
  FirebaseAuth firebaseAuth;
  AuthApiServiceImpl(this.firebaseAuth);

  @override
  Future <UserCredential> login ({required String email, required String password}) async {
    try{
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e){
      return Future.error(e.message ?? "an unexpected  error occurred");
    } catch (e){
      return Future.error(e);
    }
  }

  @override
  Future <UserCredential> signUp ({required String email, required String password}) async {
    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e){
      return Future.error(e.message ?? "an unexpected  error occurred");
    } catch (e){
      return Future.error(e);
    }
  }
  
}


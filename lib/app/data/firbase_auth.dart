import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_type/result_type.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  final _durationTimeOut = Duration(seconds: 60);

  Future<void> sendSms(
      {required String mobileNumber,
      required Function(String, int?) codeSent,
      required Function(FirebaseAuthException) verificationFailed}) async {
    bool? isSuccess;
    String messege = '';

    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + mobileNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: _durationTimeOut,
    );
  }

  Future<Result> verifySmsCode(String otp, String verificationId) async {
    try {
      await _auth.signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp));
    } catch (e) {
      return Failure('');
    } finally {
      if (_auth.currentUser != null) {
        return Success('');
      } else {
        return Failure('');
      }
    }
  }
}

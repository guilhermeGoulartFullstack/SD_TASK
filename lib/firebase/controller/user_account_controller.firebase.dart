import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sd_task/domain/period.domain.dart';
import 'package:sd_task/domain/user_account.domain.dart';
import 'package:sd_task/firebase/requests/add_user_account_request.firebase.dart';
import 'package:sd_task/firebase/requests/period_request.firebase.dart';
import 'package:sd_task/utils/date_formatter.util.dart';

class UserAccountController {
  CollectionReference<Map<String, dynamic>> userAccountRepository =
      FirebaseFirestore.instance.collection("userAccount");

  Future<UserAccount> get({User? user}) async {
    try {
      _isUserIdNull(user);
      bool doesUserExist = await _doesAccountExist(userId: user!.uid);
      if (!doesUserExist) {
        throw Exception("Usário não existe");
      }

      DocumentSnapshot<Map<String, dynamic>> userAccountDoc =
          await userAccountRepository.doc(user.uid).get();

      QuerySnapshot<Map<String, dynamic>> userAccountPeriods =
          await userAccountRepository.doc(user.uid).collection("periods").get();

      List<Period>? periodList = [];
      userAccountPeriods.docs.forEach((element) {
        Period newPeriod = Period.fromMap(element);

        periodList.add(newPeriod);
      });

      if (userAccountDoc.exists && (userAccountDoc.data() != null)) {
        return UserAccount.fromMap(
          map: userAccountDoc.data()!,
          periods: periodList.isNotEmpty ? periodList : null,
        );
      } else {
        throw Exception("Erro inesperado");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> add({User? user}) async {
    try {
      _isUserIdNull(user);

      bool doesUserExist = await _doesAccountExist(userId: user!.uid);
      if (doesUserExist) {
        return;
      }

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        AddUserAccountRequest request = AddUserAccountRequest(
          id: user.uid,
          nickname: user.displayName ?? "Novo usuário",
        );

        DocumentReference<Map<String, dynamic>> userAccountDoc =
            await userAccountRepository.doc(user.uid);
        Map<String, dynamic> newUser = addUserAccountRequestToMap(request);

        await transaction.set(userAccountDoc, newUser);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePhoto({User? user, required XFile file}) async {
    try {
      _isUserIdNull(user);
      bool doesUserExist = await _doesAccountExist(userId: user!.uid);
      if (!doesUserExist) {
        throw Exception("Usário não existe");
      }
      String path = user.uid;

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceChild = referenceRoot.child('images');

      Reference referenceImageToUpload = referenceChild.child(path);
      await referenceImageToUpload.putFile(File(file.path));

      String downloadPath = await referenceImageToUpload.getDownloadURL();

      await userAccountRepository
          .doc(user.uid)
          .set({"photo_url": downloadPath}, SetOptions(merge: true));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addPeriod({User? user, required PeriodRequest request}) async {
    try {
      _isUserIdNull(user);
      bool doesUserExist = await _doesAccountExist(userId: user!.uid);
      if (!doesUserExist) {
        throw Exception("Usário não existe");
      }
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        CollectionReference<Map<String, dynamic>> periodCollection =
            await userAccountRepository.doc(user.uid).collection("periods");

        Map<String, dynamic> newPeriod = periodRequestToMap(request);

        await transaction.set(periodCollection.doc(), newPeriod);
      });
    } catch (e) {
      rethrow;
    }
  }

  void _isUserIdNull(User? user) {
    if (user == null) {
      Exception("Erro ao conectar com o servidor");
    }
  }

  Future<bool> _doesAccountExist({required String userId}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await userAccountRepository.doc(userId).get();

      return snapshot.exists;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

Future creatUser(
    {required name,
      required phoneNumber,
      required email,
      required result}) async {
  final user =
  FirebaseFirestore.instance.collection("users").doc(phoneNumber);

  final json = {
    "name": name,
    "Phone Number": phoneNumber,
    "Email": email,
    "Spin wheel Result": result
  };
  await user.set(json);
}
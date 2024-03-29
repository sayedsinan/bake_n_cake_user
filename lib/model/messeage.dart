import 'package:cloud_firestore/cloud_firestore.dart';

class Messeage {
  final String senderUserId;
  final String senderEmail;
  final String reciverId;
  final String messeage;
  final Timestamp timestamp;

  Messeage( {
    required this.senderUserId,
    required this.senderEmail,
    required this.reciverId,
    required this.timestamp,
    required this.messeage,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderUserId,
      'senderEmail': senderEmail,
      'recivrId': reciverId,
      'message': messeage,
      'timestamp':timestamp,
    };
  }
}

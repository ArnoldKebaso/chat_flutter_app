// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class MessageModel {
//   final String id;
//   final String senderId;
//   final String text;
//   final String? imageUrl;
//   final Timestamp createdAt;
//
//   const MessageModel({
//     required this.id,
//     required this.senderId,
//     required this.text,
//     this.imageUrl,
//     required this.createdAt,
//   });
//
//   factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
//     id: json['id'],
//     senderId: json['senderId'],
//     text: json['text'],
//     imageUrl: json['imageUrl'],
//     createdAt: json['createdAt'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'senderId': senderId,
//     'text': text,
//     'imageUrl': imageUrl,
//     'createdAt': createdAt,
//   };
// }

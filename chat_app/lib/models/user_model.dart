class UserModel {
  final String uid;
  final String displayName;
  final String? photoUrl;
  const UserModel({
    required this.uid,
    required this.displayName,
    this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    displayName: json['displayName'],
    photoUrl: json['photoUrl'],
  );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'displayName': displayName,
    'photoUrl': photoUrl,
  };
}

class ChatRoomModel {
  final String id;
  final List<String> participantIds;
  const ChatRoomModel({
    required this.id,
    required this.participantIds,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
    id: json['id'],
    participantIds: List<String>.from(json['participantIds']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'participantIds': participantIds,
  };
}

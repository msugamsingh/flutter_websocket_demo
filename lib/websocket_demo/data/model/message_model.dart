import 'package:websocket_demo/websocket_demo/domain/entity/meesage_entity.dart';

class MessageModel extends MessageEntity {
  final String messageId;

  const MessageModel({required this.messageId, super.message});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json["message_id"],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message_id': messageId, 'message': message};
  }
}

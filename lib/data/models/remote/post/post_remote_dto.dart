import 'package:json_annotation/json_annotation.dart';
part 'post_remote_dto.g.dart';

@JsonSerializable(createToJson: false)
class PostRemoteDTO {
  final int id;
  final String title;
  final String body;
  final int userId;

  PostRemoteDTO({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$PostRemoteDTOFromJson(json);
}

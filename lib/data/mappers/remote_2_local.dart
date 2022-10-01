import 'package:rzagram/data/models/local/post/post_local_dto.dart';
import 'package:rzagram/data/models/remote/post/post_remote_dto.dart';

extension Remote2Local on PostRemoteDTO {
  PostLocalDTO toLocal() => PostLocalDTO(
        id,
        title,
        body,
        userId,
      );
}

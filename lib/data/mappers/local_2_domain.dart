import 'package:rzagram/data/models/local/post/post_local_dto.dart';
import 'package:rzagram/domain/entities/post_entity.dart';

extension Local2Domain on PostLocalDTO {
  PostEntity toDomain() => PostEntity(
        id: id,
        title: title,
        body: body,
        userId: userId,
      );
}

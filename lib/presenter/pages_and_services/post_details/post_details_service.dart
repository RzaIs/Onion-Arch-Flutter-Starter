import 'package:rzagram/domain/entities/post_entity.dart';
import 'package:rzagram/presenter/pages_and_services/base/base_service.dart';

class PostDetailsService extends BaseService {
  PostEntity postEntity;

  PostDetailsService({required this.postEntity});
}

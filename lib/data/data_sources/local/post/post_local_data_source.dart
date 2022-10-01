import 'package:rxdart/subjects.dart';
import 'package:rzagram/data/data_sources/local/post/post_local_data_source_ac.dart';
import 'package:rzagram/data/database/database_provider_ac.dart';
import 'package:rzagram/data/models/local/post/post_local_dto.dart';

class PostLocalDataSource extends PostLocalDataSourceAC {
  late final BehaviorSubject<List<PostLocalDTO>> postSubject;
  final DatabaseProviderAC databaseProvider;

  PostLocalDataSource({required this.databaseProvider}) {
    postSubject = BehaviorSubject.seeded(databaseProvider.readAll());
  }

  @override
  void delete() {
    databaseProvider.deleteAll<PostLocalDTO>();
  }

  @override
  Stream<List<PostLocalDTO>> observePosts() {
    return postSubject.asBroadcastStream();
  }

  @override
  void write({required List<PostLocalDTO> posts}) {
    databaseProvider.deleteAll<PostLocalDTO>();
    databaseProvider.write(objects: posts);
    postSubject.add(posts);
  }
}

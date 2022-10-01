import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';
import 'package:rzagram/data/data_sources/local/post/post_local_data_source.dart';
import 'package:rzagram/data/data_sources/local/post/post_local_data_source_ac.dart';
import 'package:rzagram/data/data_sources/remote/post/post_remote_data_source.dart';
import 'package:rzagram/data/data_sources/remote/post/post_remote_data_source_ac.dart';
import 'package:rzagram/data/database/database_provider.dart';
import 'package:rzagram/data/database/database_provider_ac.dart';
import 'package:rzagram/data/networking/network_provider.dart';
import 'package:rzagram/data/networking/network_provider_ac.dart';
import 'package:rzagram/data/repositories/post_repo.dart';
import 'package:rzagram/domain/abstract_repos/post_repo_ac.dart';
import 'package:rzagram/data/models/local/post/post_local_dto.dart';

GetIt dataGetIt = GetIt.instance;

void dataAssemble({required String baseURL}) {
  // Realm

  dataGetIt.registerLazySingleton(() {
    Configuration config = Configuration.local([PostLocalDTO.schema]);
    return Realm(config);
  });

  // Providers

  dataGetIt.registerFactory(() {
    DatabaseProviderAC databaseProvider =
        DatabaseProvider(dataGetIt.get<Realm>());
    return databaseProvider;
  });

  dataGetIt.registerFactory(() {
    NetworkProviderAC networkProvider = NetworkProvider(baseURL: baseURL);
    return networkProvider;
  });

  // Local Data Sources

  dataGetIt.registerLazySingleton(() {
    PostLocalDataSourceAC localDataSource = PostLocalDataSource(
      databaseProvider: dataGetIt.get<DatabaseProviderAC>(),
    );
    return localDataSource;
  });

  // Remote Data Sources

  dataGetIt.registerFactory(() {
    PostRemoteDataSourceAC remoteDataSource = PostRemoteDataSource(
      networkProvider: dataGetIt.get<NetworkProviderAC>(),
    );
    return remoteDataSource;
  });

  // Repositories

  dataGetIt.registerFactory(() {
    PostRepoAC repo = PostRepo(
      remoteDataSource: dataGetIt.get<PostRemoteDataSourceAC>(),
      localDataSource: dataGetIt.get<PostLocalDataSourceAC>(),
    );
    return repo;
  });
}

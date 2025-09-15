import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasource dataSource;
  ActorRepositoryImpl(this.dataSource);


  @override
  Future<List<Actor>> getActorsByMovie(String movieId){
    return dataSource.getActorsByMovie(movieId);
  }


}
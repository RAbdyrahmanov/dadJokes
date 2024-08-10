import 'package:dad_jokes/features/dad_jokes/data/mapper/joke_mapper.dart';
import 'package:dad_jokes/features/dad_jokes/data/model/joke_response.dart';
import 'package:dad_jokes/features/dad_jokes/domain/entity/joke_entity.dart';
import 'package:dad_jokes/features/dad_jokes/domain/repository/jokes_repository.dart';

class GetSingleJokeUsecase {
  final JokesRepository repository;
  final JokeMapper mapper;

  GetSingleJokeUsecase({
    required this.repository,
    required this.mapper,
  });

  Future<JokeEntity> getSingleJoke() async {
    JokeResponse jokeResponse;
    do {
      jokeResponse = await repository.fetchJoke();
    } while (!(jokeResponse.joke?.contains('?') ?? true));

    return mapper.mapResponse(jokeResponse);
  }
}

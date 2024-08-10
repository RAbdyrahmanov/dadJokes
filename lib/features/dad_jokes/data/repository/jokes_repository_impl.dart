import 'package:dad_jokes/features/dad_jokes/data/model/joke_response.dart';
import 'package:dad_jokes/features/dad_jokes/domain/repository/jokes_repository.dart';
import 'package:dio/dio.dart';

class JokesRepositoryImpl implements JokesRepository {
  final Dio dio;

  JokesRepositoryImpl({
    required this.dio,
  });
  @override
  Future<JokeResponse> fetchJoke() async {
    final response = await dio.get(
      '',
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
    );
    return JokeResponse.fromJson(response.data);
  }
}

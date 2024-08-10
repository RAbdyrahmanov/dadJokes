import 'package:dad_jokes/features/dad_jokes/data/model/joke_response.dart';

abstract class JokesRepository{

 Future <JokeResponse>  fetchJoke();

}
import 'package:dad_jokes/features/dad_jokes/domain/entity/joke_entity.dart';

abstract class JokesState {}

class JokesInitState extends JokesState {}

class JokesLoadingState extends JokesState {}

class JokesSuccesState extends JokesState {
  final JokeEntity jokes;

  JokesSuccesState({
    required this.jokes,
  });
}

class JokesErrorState extends JokesState {
  final String error;

  JokesErrorState({
    required this.error,
  });
}

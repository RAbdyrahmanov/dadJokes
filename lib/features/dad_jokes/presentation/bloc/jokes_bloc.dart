import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dad_jokes/features/dad_jokes/domain/usecase/get_single_joke_usecase.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_event.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  final GetSingleJokeUsecase _getSingleJokeUsecase;

  JokesBloc({
    required GetSingleJokeUsecase getSingleJokeUsecase,
  })  : _getSingleJokeUsecase = getSingleJokeUsecase,
        super(
          JokesInitState(),
        ) {
    on<FetchSingleJokeEvent>((event, emit) async {
      emit(JokesLoadingState());

      try {
        final response = await _getSingleJokeUsecase.getSingleJoke();
        emit(
          JokesSuccesState(jokes: response),
        );
        log('succes emitted');
      } catch (e) {
        log('error $e');
        emit(
          JokesErrorState(
            error: e.toString(),
          ),
        );
      }
    });
  }
}

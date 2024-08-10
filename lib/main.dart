import 'package:dad_jokes/core/service/dio.dart';
import 'package:dad_jokes/features/dad_jokes/data/mapper/joke_mapper.dart';
import 'package:dad_jokes/features/dad_jokes/data/repository/jokes_repository_impl.dart';
import 'package:dad_jokes/features/dad_jokes/domain/usecase/get_single_joke_usecase.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_bloc.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/jokes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokesBloc>(
      create: (context) => JokesBloc(
        getSingleJokeUsecase: GetSingleJokeUsecase(
          mapper: JokeMapper(),
          repository: JokesRepositoryImpl(dio: DioSetting().dio),
        ),
      ),
      child: const MaterialApp(
        home: JokesScreen(),
      ),
    );
  }
}

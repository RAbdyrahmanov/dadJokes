import 'dart:developer';

import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_bloc.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_event.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_state.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/widgets/jokes_bg.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/widgets/lokes_logo.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/widgets/show_joke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  @override
  void initState() {
    context.read<JokesBloc>().add(FetchSingleJokeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const JokesBg(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const JokesLogo(),
              BlocBuilder<JokesBloc, JokesState>(builder: (context, state) {
                log('state $state');
                if (state is JokesSuccesState) {
                  return ShowJoke(
                    joke: state.jokes.joke ?? '',
                  );
                } else if (state is JokesLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_bloc.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_event.dart';
import 'package:dad_jokes/features/dad_jokes/presentation/widgets/jokes_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowJoke extends StatefulWidget {
  const ShowJoke({
    required this.joke,
    super.key,
  });
  final String joke;

  @override
  State<ShowJoke> createState() => _ShowJokeState();
}

class _ShowJokeState extends State<ShowJoke> {
  bool isAnswerShow = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
     
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.25),
              ),
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.withOpacity(0.05),
            ),
            height: MediaQuery.of(context).size.height / 3,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                '${widget.joke.split('?').first}?',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                isAnswerShow ? widget.joke.split('?').last : '***********',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
              JokesBtn(
                title: 'Show answer',
                onTap: () {
                  isAnswerShow = true;
                  setState(() {});
                },
              ),
              JokesBtn(
                title: 'Get joke',
                onTap: () {
                  context.read<JokesBloc>().add(FetchSingleJokeEvent());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

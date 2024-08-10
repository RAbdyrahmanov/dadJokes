import 'package:dad_jokes/features/dad_jokes/presentation/bloc/jokes_event.dart';
import 'package:flutter/material.dart';

class JokesBg extends StatelessWidget {
  const JokesBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.001),
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.5),
                      spreadRadius: 60,
                      blurRadius: 500,
                      blurStyle: BlurStyle.outer,
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.001),
                borderRadius: BorderRadius.circular(200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.5),
                    spreadRadius: 60,
                    blurRadius: 500,
                    blurStyle: BlurStyle.outer,
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  void add(FetchSingleJokeEvent fetchSingleJokeEvent) {}
}

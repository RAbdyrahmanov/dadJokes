import 'package:dad_jokes/core/service/app_assets.dart';
import 'package:flutter/material.dart';

class JokesLogo extends StatelessWidget {
  const JokesLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppAssets.dad),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dad'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                   Text(
                    'jokes'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.orange, fontSize: 40,
                    ),
                  ),
                ],
              )
            ],
          );
  }
}
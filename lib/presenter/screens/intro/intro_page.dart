import 'package:audio_book_app/presenter/screens/intro/bloc/intro_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../widgets/button_get_started.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IntroBloc>(
      create: (_) => IntroBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xffe4e4e4),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Stack(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                          tag: "main_logo",
                          child: Image.asset(
                            '${imagePath}app_logo.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Image.asset('${imagePath}vector1.png')
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/gifs/phone.gif',
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      child: BlocConsumer<IntroBloc, IntroState>(
                        listener: (context, state) {
                          if (state is GetStartedState) {
                            Navigator.pushNamed(context, "/register");
                          }
                        },
                        builder: (context, state) {
                          return getStartedButton(() {
                            context.read<IntroBloc>().add(GetStartEvent());
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

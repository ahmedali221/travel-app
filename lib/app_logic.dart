import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/nav_pages/Main_Page.dart';
import 'package:travel/pages/DetailsPage.dart';

import 'cubit/app_states_cubit.dart';
import 'pages/WelcomePage.dart';

class AppLogic extends StatefulWidget {
  const AppLogic({super.key});

  @override
  State<AppLogic> createState() => _AppLogicState();
}

class _AppLogicState extends State<AppLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppStatesCubit, AppStatesState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomeScreen();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return const MainPage();
          }

          if (state is DetailState) {
            return const DetailsPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

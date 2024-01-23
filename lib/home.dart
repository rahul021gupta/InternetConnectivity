import 'package:bloc_demo/bloc/internet_bloc/bloc.dart';
import 'package:bloc_demo/bloc/internet_bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (BuildContext context, state) {
          if (state is InternetGainedState) {
            return Center(child: Text("Connected"));
          } else if (state is InternetLostState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Loading..."));
          }
        },
      ),
    );
  }
}

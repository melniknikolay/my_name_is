import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_name_is/bloc/my_card/my_card_bloc.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFirebase = FirebaseAuth.instance.currentUser;

    if (context.watch<MyCardBloc>().state is MyCardLoaded) {
      final user = (context.read<MyCardBloc>().state as MyCardLoaded).person;
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text('Тебя зовут ${user.firstName}'),
              const SizedBox(height: 10),
              Text('Твоя фамилия ${user.familyName}')
            ],
          ),
        ),
      );
    } else {
      context.read<MyCardBloc>().add(GetCardEvent(userFirebase!.uid));
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

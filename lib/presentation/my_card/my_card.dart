import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_name_is/bloc/my_card/my_card_bloc.dart';
import 'package:my_name_is/data/repositories/firebase_card_repository.dart';
import 'package:my_name_is/data/repositories/i_business_card_repository.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFirebase = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: RepositoryProvider<IBusinessCardRepository>(
        lazy: false,
        create: (context) => FirebaseCardRepository(),
        child: BlocProvider(
          lazy: false,
          create: (context) =>
              MyCardBloc(businessCardRepository: RepositoryProvider.of<IBusinessCardRepository>(context)),
          child: BlocBuilder<MyCardBloc, MyCardState>(
            builder: (context, state) {
              if (state is MyCardLoaded) {
                final user = (context.read<MyCardBloc>().state as MyCardLoaded).person;
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Text('Тебя зовут ${user.firstName}'),
                      const SizedBox(height: 10),
                      Text('Твоя фамилия ${user.familyName}')

                    ],
                  ),
                );
              } else {
                context.read<MyCardBloc>().add(GetCardEvent(userFirebase!.uid));
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

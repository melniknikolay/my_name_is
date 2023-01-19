import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_name_is/bloc/auth/auth_bloc.dart';
import 'package:my_name_is/data/entity/user.dart';

import '../../bloc/my_card/my_card_bloc.dart';
import '../../data/repositories/firebase_card_repository.dart';
import '../../data/repositories/i_business_card_repository.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({Key? key}) : super(key: key);

  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _familyNameController = TextEditingController();
  final userFirebase = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider<IBusinessCardRepository>(
        create: (context) => FirebaseCardRepository(),
        child: BlocProvider(
          create: (context) =>
              MyCardBloc(businessCardRepository: RepositoryProvider.of<IBusinessCardRepository>(context)),
          child: BlocBuilder<MyCardBloc, MyCardState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    TextFormField(
                      key: const ValueKey('FirstNameCard'),
                      keyboardType: TextInputType.text,
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        hintText: "Введите ваше имя",
                        border: OutlineInputBorder(),
                      ),
                      // autovalidateMode: AutovalidateMode.,
                      // validator: (value) {
                      //   return value != null ? 'Введите корректное имя' : null;
                      // },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      key: const ValueKey('FamilyNameCard'),
                      keyboardType: TextInputType.text,
                      controller: _familyNameController,
                      decoration: const InputDecoration(
                        hintText: "Введите вашу фаминию",
                        border: OutlineInputBorder(),
                      ),
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   return value != null ? 'Введите корректную фамилию' : null;
                      // },
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        key: const ValueKey('CreateCardConfirmButton'),
                        child: const Text('Создать визитку'),
                        onPressed: () {
                          final user = Person(
                            internalId: userFirebase?.uid,
                            firstName: _firstNameController.value.text,
                            familyName: _familyNameController.value.text,
                          );
                          context.read<MyCardBloc>().add(CreateCardEvent(user));
                          context.read<MyCardBloc>().add(GetCardEvent(user.internalId!));
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _createCard(BuildContext context) {
    final user = Person(
      internalId: userFirebase?.uid,
      firstName: _firstNameController.value.text,
      familyName: _familyNameController.value.text,
    );
    BlocProvider.of<MyCardBloc>(context).add(CreateCardEvent(user));
  }
}

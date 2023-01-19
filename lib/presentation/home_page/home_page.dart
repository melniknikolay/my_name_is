import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../my_card/my_card.dart';
import '../sign_in_page/sign_in_page.dart';
import '../create_card_page/create_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Получение пользователя из FirebaseAuth
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Переход к экрану входа когда пользователь разлогинивается
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SignIn()),
                  (route) => false,
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Добро пожаловать ${user?.email}',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  key: const ValueKey('CreateCardButton'),
                  child: const Text('Создать визитку'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CreateCard()));
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  key: const ValueKey('ShowMyCardButton'),
                  child: const Text('Показать визитку'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MyCard()));
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  key: const ValueKey('SignOutButton'),
                  child: const Text('Выйти'),
                  onPressed: () {
                    // Signing out the user
                    context.read<AuthBloc>().add(SignOutRequested());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
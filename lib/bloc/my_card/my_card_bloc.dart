import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/i_business_card_repository.dart';
import '/data/entity/user.dart';

part 'my_card_event.dart';

part 'my_card_state.dart';

class MyCardBloc extends Bloc<MyCardEvent, MyCardState> {
  final IBusinessCardRepository businessCardRepository;

  MyCardBloc({required this.businessCardRepository}) : super(MyCardInitial()) {
    on<CreateCardEvent>((event, emit) async {
      try {
        await businessCardRepository.createMyCard(event.user);
        emit(MyCardLoaded(event.user));
      } catch (e) {
        emit(MyCardError(e.toString()));
      }
    });
    on<GetCardEvent>((event, emit) async {
      try {
        final result = await businessCardRepository.getMyCard(event.userId);
        emit(MyCardLoaded(result));
      } catch (e) {
        emit(MyCardError(e.toString()));
      }
    });
  }
}

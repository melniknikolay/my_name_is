part of 'my_card_bloc.dart';

@immutable
abstract class MyCardState {}

class MyCardInitial extends MyCardState {}

class MyCardLoaded extends MyCardState {
  final Person person;

  MyCardLoaded(this.person);

  List<Object?> get props => [person];
}

class MyCardError extends MyCardState {
  final String error;

  MyCardError(this.error);

  List<Object?> get props => [error];
}

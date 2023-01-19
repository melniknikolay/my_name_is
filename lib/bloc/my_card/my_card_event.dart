part of 'my_card_bloc.dart';

@immutable
abstract class MyCardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateCardEvent extends MyCardEvent {
  final Person user;

  CreateCardEvent(this.user);
}

class GetCardEvent extends MyCardEvent {
  final String userId;

  GetCardEvent(this.userId);
}

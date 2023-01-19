import 'package:firebase_database/firebase_database.dart';
import 'package:my_name_is/data/repositories/i_business_card_repository.dart';
import '../entity/user.dart';

class FirebaseCardRepository implements IBusinessCardRepository {
  final _database = FirebaseDatabase.instance;

  @override
  Future<void> addCardToCollection() {
    // TODO: implement addCardToCollection
    throw UnimplementedError();
  }

  @override
  Future<void> changeMyCard() {
    // TODO: implement changeMyCard
    throw UnimplementedError();
  }

  @override
  Future<void> createMyCard(User user) async {
    try {
      await _database.ref('user/contact/${user.internalId}').set(user.toJson());
    } catch (error) {
      throw Exception('Не получилось создать визитку');
    }

  }

  @override
  Future<void> deleteCardFromCollection() {
    // TODO: implement deleteCardFromCollection
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMyCard() {
    // TODO: implement deleteMyCard
    throw UnimplementedError();
  }

  @override
  Future<void> getAllCard() {
    // TODO: implement getAllCard
    throw UnimplementedError();
  }

  @override
  Future<DataSnapshot?> getMyCard(User user) async {
    try{
      final result = await _database.ref('users/${user.internalId}').get();
      return result;
    } catch(error){
      throw Exception('Не получилось загрузить личную визитку');
    }
  }

  @override
  Future<void> qrCodeSearch() {
    // TODO: implement qrCodeSearch
    throw UnimplementedError();
  }

  @override
  Future<void> search() {
    // TODO: implement search
    throw UnimplementedError();
  }
}

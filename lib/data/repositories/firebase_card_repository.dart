import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_name_is/data/repositories/i_business_card_repository.dart';
import '../entity/user.dart';

class FirebaseCardRepository implements IBusinessCardRepository {
  final _database = FirebaseFirestore.instance.collection('users');

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
  Future<void> createMyCard(Person user) async {
    try {
      await _database.doc(user.internalId).set(user.toJson());
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
  Future<Person> getMyCard(String userId) async {
    try {
      final result = _database.snapshots().map((event) => event.docs.firstWhere((doc) => doc.id == userId).data());
      final person = await result.first;
      return Person.fromJson(person);
    } catch (error) {
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

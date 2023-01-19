import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/user.dart';

abstract class IBusinessCardRepository {
  // получить все визитку
  Future<void> getAllCard();

  // РАБОТА СО СВОЕЙ ВИЗИТКОЙ
  // получить мою визитку
  Future<Person> getMyCard(String userId);
  // создать визитку
  Future<void> createMyCard(Person user);
  // изменить визитку
  Future<void> changeMyCard();
  // удалить визитку
  Future<void> deleteMyCard();

  // РАБОТА С ЧУЖИМИ ВИЗИТКАМИ
  // добавить визитку в коллекцию визиток
  Future<void> addCardToCollection();
  // удалить визитку в коллекцию
  Future<void> deleteCardFromCollection();
  // поиск по qr-code
  Future<void> qrCodeSearch();
  // поиск по другим полям
  Future<void> search();

}
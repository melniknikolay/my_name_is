import '../entity/user.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class IBusinessCardRepository {
  // получить все визитку
  Future<void> getAllCard();

  // РАБОТА СО СВОЕЙ ВИЗИТКОЙ
  // получить мою визитку
  Future<DataSnapshot?> getMyCard(User user);
  // создать визитку
  Future<void> createMyCard(User user);
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
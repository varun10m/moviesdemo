// ignore_for_file: file_names

import 'package:floor/floor.dart';
import 'package:moviesdemo/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();
  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findUserByUserName(int id);

  @insert
  Future<void> insertUser(User user);
}

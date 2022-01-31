// ignore_for_file: file_names

// required package imports
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:moviesdemo/user.dart';
import 'package:moviesdemo/userDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'AppDatabase.g.dart'; // the generated code will be there

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}

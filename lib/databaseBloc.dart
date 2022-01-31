// ignore_for_file: file_names

import 'package:moviesdemo/AppDatabase.dart';

class DataBaseBloc {
  static DataBaseBloc? _instance;
  static DataBaseBloc? getInstance() {
    if (_instance == null) _instance = DataBaseBloc();
    return _instance;
  }

  late AppDatabase _appDatabase;
  Future<void> loadDataBase() async {
    $FloorAppDatabase
        .databaseBuilder('user_database.db')
        .build()
        .then((value) async {
      _appDatabase = value;
    });
  }

  AppDatabase getDatabase() {
    $FloorAppDatabase
        .databaseBuilder('user_database.db')
        .build()
        .then((value) async {
      _appDatabase = value;
    });
    return _appDatabase;
  }
}

import 'package:floor/floor.dart';

@Entity(tableName: "User")
class User {
  @PrimaryKey(autoGenerate: false)
  late String userName;
  late String userEmail;
  late String userPassword;
  late String userPhone;

  User(
      {required this.userName,
      required this.userEmail,
      required this.userPassword,
      required this.userPhone});

  Map<String, String> toMap() {
    final Map<String, String> data = {};
    data['userName'] = userName;
    data['userEmail'] = userEmail;
    data['userPassword'] = userPassword;
    data['userPhone'] = userPhone;
    return data;
  }

  User.fromMap(Map<String, String> user) {
    userName = user['userName']!;
    userEmail = user['userEmail']!;
    userPassword = user['userPassword']!;
    userPhone = user['userPhone']!;
  }
}

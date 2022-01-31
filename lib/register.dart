import 'package:flutter/material.dart';
import 'package:moviesdemo/AppDatabase.dart';
import 'package:moviesdemo/user.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text('Register'),
          actions: [
            TextButton(
                onPressed: () => getUser(),
                child: const Text(
                  "Get users",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Text field for username
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: userNameController,
                decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    icon: Icon(Icons.person)),
              ),
              //Text field for email
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    icon: Icon(Icons.email)),
              ),
              //Text field for phone number
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: phoneController,
                decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    icon: Icon(Icons.phone)),
              ),
              //Text field for password
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    icon: Icon(Icons.lock)),
              ),
              //Text field for confirm password
              TextFormField(
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Enter your password again',
                    icon: Icon(Icons.lock)),
              ),
              //Button for register
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    registerUser();
                  },
                ),
              ),
              Row(
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    child: const Text('Login'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              //Button for login
            ],
          ),
        ),
      ),
    );
  }

  void registerUser() {
    if (_formKey.currentState!.validate()) {
      print("register");
      addNewUser(userNameController.text, passwordController.text,
          emailController.text, phoneController.text);
    }
  }

  Future<void> addNewUser(String userName, String password, String email,
      String phoneNumber) async {
    print(
      "add user called",
    );
    User user = User(
        userName: userName,
        userEmail: email,
        userPassword: password,
        userPhone: phoneNumber);
    print(user.userPhone);
    final database =
        await $FloorAppDatabase.databaseBuilder('user_database.db').build();
    final userDao = database.database.insert("User", user.toMap());
    // userDao.insertUser(user);
    // await DataBaseBloc.getInstance()!.getDatabase().userDao.insertUser(user);
    print("Inserted new User");
    _key.currentState!.showSnackBar(const SnackBar(
      content: Text("Registration successful!"),
    ));
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(
        context,
      );
    });
  }

  getUser() async {
    final db =
        await $FloorAppDatabase.databaseBuilder("user_database.db").build();
    var userList = await db.database.rawQuery("SELECT * FROM User");
    print(userList.toString());
  }
}

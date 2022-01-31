import 'package:flutter/material.dart';
import 'package:moviesdemo/AppDatabase.dart';
import 'package:moviesdemo/MoviesList/moviesList.dart';
import 'package:moviesdemo/databaseBloc.dart';
import 'package:moviesdemo/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AppDatabase database;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    loadDatabase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please enter user name";
                    }
                  },
                  controller: userNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Password field can't be empty";
                    }
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => validateUser(),
                child: const Text('Login'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("New User?"),
                    TextButton(
                        onPressed: onRegisterClicked,
                        child: const Text("Register")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onRegisterClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  Future<void> get loadDatabase async {
    await DataBaseBloc.getInstance()!.loadDataBase();
  }

  validateUser() async {
    if (_formKey.currentState!.validate()) {
      final db =
          await $FloorAppDatabase.databaseBuilder("user_database.db").build();
      List<Map<String, dynamic>> userList = await db.database.rawQuery(
          "SELECT * FROM User WHERE userName = '${userNameController.text}'AND userPassword='${passwordController.text}'");
      print("userList=" + userList.toString());
      if (userList.isEmpty) {
        //add snack bar
        _key.currentState!.showSnackBar(
            const SnackBar(content: Text("your password is  Incorrect")));
        print("user doesn't exist");
      } else {
        print("user exists");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MoviesList()));
      }
    }
  }
}

import 'package:diary_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    bool obscure,
  ) {
    return TextField(
      obscureText: obscure,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.primaryColor.shade500,
        hintText: title,
        hintStyle: const TextStyle(color: Colors.white54, fontSize: 12),
        labelStyle: const TextStyle(color: Colors.white70),
        constraints: const BoxConstraints(
          maxHeight: 48,
          maxWidth: 327,
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage',
        style: const TextStyle(color: Colors.white54));
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Anmelden' : 'Registrieren'),
    );
  }

  Widget _gradientText() {
    return GradientText(
      'Diary',
      style: const TextStyle(
        fontSize: 50.0,
      ),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: .4,
      colors: const [
        Colors.orange,
        Colors.purple,
      ],
    );
  }

  Widget _logo() {
    return Column(
      children: const [
        Image(
          image: AssetImage('lib/assets/img/logo.png'),
          width: 100,
        ),
      ],
    );
  }

  Widget _subTitle() {
    return const Text(
      'Deine Tagebuch App, für jeden Tag!',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
        isLogin
            ? 'Noch keinen Account? Hier einen erstellen'
            : 'Du hast schon einen Account? Melde dich hier an',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white70,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.deepPurple,
            Colors.blue,
          ],
        )),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 80),
              _logo(),
              _gradientText(),
              _subTitle(),
              const SizedBox(height: 40),
              _entryField('E-Mail', _controllerEmail, false),
              const SizedBox(height: 16),
              _entryField('Passwort', _controllerPassword, true),
              const SizedBox(height: 6),
              _errorMessage(),
              const SizedBox(height: 6),
              _submitButton(),
              _loginOrRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

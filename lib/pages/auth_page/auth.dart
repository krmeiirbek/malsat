import 'package:flutter/material.dart';
import 'package:malsat/pages/auth_page/components/auth_signin_or_signup_button.dart';
import 'package:malsat/pages/auth_page/components/auth_switch_button.dart';

enum WidgetMarker { login, signUp }

class Auth extends StatefulWidget {
  const Auth({
    Key? key,
  }) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.login;
  bool _hidePassword = true;
  bool _hideRegPassword = true;

  final _loginEmailController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  final _registerNameController = TextEditingController();
  final _registerPhoneController = TextEditingController();
  final _registerRePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    _registerNameController.dispose();
    _registerPhoneController.dispose();
    _registerRePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: _size.height * 0.15),
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 30,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: AuthSwitchButton(
                        text: 'Войти',
                        press: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.login;
                          });
                        },
                        isSelected: selectedWidgetMarker == WidgetMarker.login,
                      ),
                    ),
                    Expanded(
                      child: AuthSwitchButton(
                        press: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.signUp;
                          });
                        },
                        text: 'Регистрация',
                        isSelected: selectedWidgetMarker == WidgetMarker.signUp,
                      ),
                    ),
                  ],
                ),
                getCustomContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.login:
        _registerPasswordController.clear();
        _registerRePasswordController.clear();
        return getSignInContainer();
      case WidgetMarker.signUp:
        _loginPasswordController.clear();
        return getSignUpContainer();
    }
  }

  Widget getSignInContainer() {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
          controller: _loginEmailController,
          decoration: _inputDecoration("Введите ваш email"),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: _hidePassword,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
          controller: _loginPasswordController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _hidePassword ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF616E77),
              ),
              onPressed: () {
                setState(() {
                  _hidePassword = !_hidePassword;
                });
              },
            ),
            hintText: "Введите ваш пароль",
            hintStyle: const TextStyle(
              color: Color.fromRGBO(74, 86, 74, 0.4),
              fontSize: 14.0,
            ),
            fillColor: const Color(0xFFF2F1F1),
            filled: true,
            focusColor: const Color(0xFF000000),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        AuthSignInOrSignUpButton(
          text: 'Вход',
          press: () {},
        ),
        const SizedBox(height: 1),
        MaterialButton(
          child: const Text(
            'Забыли пароль?',
            style: TextStyle(
              color: Color(0xFF616E77),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget getSignUpContainer() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
          controller: _registerEmailController,
          decoration: _inputDecoration("Введите ваш email"),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
          controller: _registerNameController,
          decoration: _inputDecoration("Введите ваш имя"),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.phone,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
          controller: _registerPhoneController,
          decoration: _inputDecoration("Введите ваш номер телефона"),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: _hideRegPassword,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
          controller: _registerPasswordController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _hideRegPassword ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF616E77),
              ),
              onPressed: () {
                setState(() {
                  _hideRegPassword = !_hideRegPassword;
                });
              },
            ),
            hintText: "Придумайте пароль",
            hintStyle: const TextStyle(
              color: Color.fromRGBO(74, 86, 74, 0.4),
              fontSize: 14.0,
            ),
            fillColor: const Color(0xFFF2F1F1),
            filled: true,
            focusColor: const Color(0xFF000000),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: _hideRegPassword,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
          controller: _registerRePasswordController,
          decoration: _inputDecoration("Повторите пароль"),
        ),
        const SizedBox(height: 10),
        AuthSignInOrSignUpButton(
          text: 'Зарегистрироваться',
          press: () {},
        ),
        const SizedBox(height: 1),
        MaterialButton(
          child: const Text(
            'Уже есть аккаунт?',
            style: TextStyle(
              color: Color(0xFF616E77),
            ),
          ),
          onPressed: () {
            setState(() {
              selectedWidgetMarker = WidgetMarker.login;
            });
          },
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color.fromRGBO(74, 86, 74, 0.4),
        fontSize: 14.0,
      ),
      fillColor: const Color(0xFFF2F1F1),
      filled: true,
      focusColor: const Color(0xFF000000),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    );
  }
}

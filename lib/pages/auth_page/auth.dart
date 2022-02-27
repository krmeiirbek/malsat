import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 173,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 30,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 140,
                  height: 23.33,
                ),
              ),
              Row(

              ),
            ],
          ),
        ),
      ),
    );
  }
}

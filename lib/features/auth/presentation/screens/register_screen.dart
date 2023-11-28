import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SlideInRight(
      child: Scaffold(
        body: Column(children: [
          Text(
            'Register',
            style: textStyles.titleLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            child: Text(
              'Volver',
              style: textStyles.titleSmall,
            ),
            onTap: () {
              context.go('/login');
            },
          )
        ]),
      ),
    );
  }
}

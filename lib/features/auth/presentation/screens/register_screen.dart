import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Column(children: [
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
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:barber_haircut_mobile/features/shared/shared.dart';
import 'package:barber_haircut_mobile/features/auth/presentation/providers/providers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                color: Colors.primaries[3],
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    const Icon(
                      Icons.production_quantity_limits_rounded,
                      size: 100,
                    ),
                    const SizedBox(height: 80),
                    Container(
                      height: size.height -
                          260, // 80 los dos sizebox y 100 el ícono
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100)),
                      ),
                      child: const _LoginForm(),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final loginProvider = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;

      showSnackbar(context, next.errorMessage);
    });

    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text('Login', style: textStyles.titleLarge),
            const SizedBox(height: 50),
            CustomTextFormField(
              label: 'Correo',
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                ref.read(loginFormProvider.notifier).onEmailChange(value);
              },
              errorMessage: loginProvider.isFormPosted
                  ? loginProvider.email.errorMessage
                  : null,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) {
                ref.read(loginFormProvider.notifier).onPasswordChanged(value);
              },
              errorMessage: loginProvider.isFormPosted
                  ? loginProvider.password.errorMessage
                  : null,
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                    text: 'Ingresar',
                    buttonColor: Colors.primaries[3],
                    onPressed: loginProvider.isPosting
                        ? null
                        : ref.read(loginFormProvider.notifier).onFormSubmit)),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                    onPressed: () {
                      ref.read(loginFormProvider.notifier).onFormSubmit();
                      //context.push('/register')
                    },
                    child: const Text('Crea una aquí'))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              child: Text(
                'Theme Config',
                style: textStyles.titleSmall,
              ),
              onTap: () {
                context.go('/theme-settings');
              },
            )
          ],
        ));
  }
}

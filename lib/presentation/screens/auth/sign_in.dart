import 'package:flutter/material.dart';
import 'widgets/custom_text_form_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1000;

        Widget sideImage({double? height}) => Image.asset(
          'assets/route.png',
          width: isDesktop ? constraints.maxWidth * 0.5 : double.infinity,
          height: height ?? double.infinity,
          fit: BoxFit.cover,
        );

        Widget signInForm() => Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(isDesktop ? 64 : 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello Again!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 32),
                  CustomTextFormField(
                    label: 'Email',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    obscureText: false,
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    obscureText: _obscure,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle sign in
                        }
                      },
                      child: const Text('Sign In'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        return Scaffold(
          body: isDesktop
              ? Row(
            children: [
              sideImage(),
              Expanded(child: signInForm()),
            ],
          )
              : SingleChildScrollView(
            child: Column(
              children: [
                sideImage(height: 250),
                signInForm(),
              ],
            ),
          ),
        );
      },
    );
  }
}

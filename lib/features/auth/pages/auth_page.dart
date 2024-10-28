import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool groupValue = true;
  final formKeySignIn = GlobalKey<FormState>();
  final formKeySignUp = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";

  signIn() {
    if (formKeySignIn.currentState!.validate()) {}
  }

  signUp() {
    if (formKeySignUp.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Radio(
                value: true,
                groupValue: groupValue,
                onChanged: (value) {},
              ),
              title: const Text("Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                setState(() {
                  groupValue = true;
                });
              },
            ),
            groupValue ? createWidget() : Container(),
            ListTile(
              leading: Radio(
                value: false,
                groupValue: groupValue,
                onChanged: (value) {},
              ),
              title: const Text(
                "Sign-in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  groupValue = false;
                });
              },
            ),
            groupValue ? Container() : signWidget(),
          ],
        ),
      ),
    );
  }

  Widget createWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKeySignUp,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Please enter a valid name (letters and spaces only)';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Name",
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
              onChanged: (value) => name = value,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }

                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Email",
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
              onChanged: (value) => email = value,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                // Minimum length check
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Password",
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
              onChanged: (value) => password = value,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: signUp,
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 50)),
              child: const Text(
                "Sign Up",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKeySignIn,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }

                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Email",
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
              onChanged: (value) => email = value,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                // Minimum length check
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Password",
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
              onChanged: (value) => password = value,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: signIn,
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 50)),
              child: const Text(
                "Sign In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

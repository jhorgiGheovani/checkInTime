import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//email: test3@gmail.com
//pass: test3@gmail.com
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Email"),
              controller: email,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: "Password"),
              controller: password,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    // print("email ${email.text} password ${password.text}");
                    _loginFunc(context, email.text, password.text);
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFF52ABFE))),
                  child: const Text("Submit")),
            )
          ],
        ));
  }
}

Future<void> _loginFunc(
    BuildContext context, String email, String password) async {
  try {
    print("emailf => $email , password $password");
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    String uid = userCredential.user?.uid ?? '';

    print("UID value ==> $uid");
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${e}")),
    );
  }
}

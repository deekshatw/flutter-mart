import 'package:flutter/material.dart';
import 'package:flutter_mart/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_mart/features/auth/services/auth.dart';
import 'package:flutter_mart/features/home/presentation/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  AuthMethods authMethods = AuthMethods();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  createUser() {
    setState(() {
      isLoading = true;
    });
    if (formKey.currentState!.validate()) {
      authMethods
          .createUserwithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((value) {
        print(value.userId);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 200, left: 24, right: 24, bottom: 24),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty || val.length < 4
                                  ? 'Please provide a valid username'
                                  : null;
                            },
                            controller: usernameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              labelText: 'Full Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                                      .hasMatch(val!)
                                  ? null
                                  : 'Please provide a valid email';
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              labelText: 'Email',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty || val.length < 6
                                  ? 'Please provide a valid password'
                                  : null;
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty ||
                                      rePasswordController.text !=
                                          passwordController.text
                                  ? 'Please enter same password twice'
                                  : null;
                            },
                            controller: rePasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Re-enter your password',
                              labelText: 'Re-password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          createUser();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Sign up with Google',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                        ),
                        const SizedBox(width: 4.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text('Sign in',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

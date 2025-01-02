import 'package:flutter/material.dart';
import 'package:myinternshipapp/Screens/Signup.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _formkey = GlobalKey<FormState>();
  bool passwordVisible = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth auth = FirebaseAuth.instance;
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Color.fromARGB(255, 4, 65, 16),
        elevation: 5,
        centerTitle: true,
        title: const Text(
          'Internship Assignment',
          style: TextStyle(
              fontSize: 20,
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(child: Image.asset('assets/images/trace.jpeg')),
              const SizedBox(
                height: 10,
              ),

              // Enter email id
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter Your Email id*",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      errorBorder: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              // Enter password
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                      obscureText: passwordVisible,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_rounded),
                        hintText: "Enter Your Password*",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        errorBorder: OutlineInputBorder(),
                        // helperText:"Password must contain special character",
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        // Validate password length between 6 to 13 characters
                        if (value.length < 6 || value.length > 13) {
                          return 'Password must be 6 to 13 characters long';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done),
                ),
              ),

              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: screenwidth * 0.6,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 225, 225, 6),
                        backgroundColor: Color.fromARGB(255, 4, 65, 16)),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        print('Email: ${emailcontroller.text}');
                        print('Password: ${passwordcontroller.text}');
                      }
                      // try {
                      //   // ignore: unused_local_variable
                      //   final userCredential =
                      //       await auth.signInWithEmailAndPassword(
                      //     email: emailcontroller.text.trim(),
                      //     password: passwordcontroller.text.trim(),
                      //   );
                      // } catch (e) {
                      //   print('Error: $e');
                      // }
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const Signup()));
                    },
                    child: Text(
                      'Dont have an Account?? Sign_Up',
                      style: TextStyle(fontSize: 19),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

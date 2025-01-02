// ignore: file_names
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:myinternshipapp/Screens/HomeScreen.dart';
import 'package:myinternshipapp/Screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // text editing controller
  final _formkey = GlobalKey<FormState>();
  bool passwordVisible = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  // bool _validate = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  // Method to validate the email the take
  // the user email as an input and
  // print the bool value in the console.
  // Function to validate email id.
  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 65, 16),
        elevation: 5,
        centerTitle: true,
        title: const Text(
          'Internship Assignment',
          style: TextStyle(
              fontSize: 20,
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height:15),
              // Text(screenwidth.toString()),
              const SizedBox(height: 35),

              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Center(
                  child: Text(
                    "Enter The Following Details to get Started with the App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Name Box
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: SizedBox(
                    width: screenwidth * 0.93,
                    child: TextFormField(
                      controller: namecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'Name must only contain letters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter Your Full name*",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        errorBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),

              // Email Box
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: SizedBox(
                    width: screenwidth * 0.93,
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
                          return 'Please enter your Email Id';
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
              ),

              // Password Box
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: SizedBox(
                    width: screenwidth * 0.93,
                    child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password_rounded),
                          hintText: "Create Your Own Password*",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          errorBorder: OutlineInputBorder(),
                          helperText: "Password must be 6 characters long",
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
              ),

              const SizedBox(height: 50),
              // Option to move to Login Screen
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const loginscreen()));
                    },
                    child: Center(
                      child: Text(
                        'Already Have an Account?? Log_In',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),

              const SizedBox(
                height: 30,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: SizedBox(
                    width: screenwidth * 0.65,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 225, 225, 6),
                            backgroundColor: Color.fromARGB(255, 4, 65, 16)),
                        // User entry with email and password.
                        onPressed: () async {
                          try {
                            if (_formkey.currentState!.validate()) {
                              print('Name: ${namecontroller.text}');
                              print('Email: ${emailcontroller.text}');
                              print('Password: ${passwordcontroller.text}');
                            }
                            //     await FirebaseAuth.instance
                            //         .createUserWithEmailAndPassword(
                            //             email: emailcontroller.text,
                            //             password: passwordcontroller.text)
                            //         .then((value) {
                            //       print("New Account Created");
                            //       showDialog(
                            //         context: context,
                            //         builder: (ctx) => AlertDialog(
                            //           title:
                            //               const Text("Successful registration!!"),
                            //           content: const Text(
                            //               "You have Created A New Account!!"),
                            //           actions: <Widget>[
                            //             TextButton(
                            //               onPressed: () {
                            //                 Navigator.of(context)
                            //                     .push(MaterialPageRoute(
                            //                         builder:
                            //                             (BuildContext context) =>
                            //                                 HomeScreen()))
                            //                     .onError((error, stackTrace) {});
                            //               },
                            //               child: Container(
                            //                 color: Colors.green,
                            //                 padding: const EdgeInsets.all(14),
                            //                 child: const Text("okay"),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       );
                            //     });
                          } catch (e) {
                            print(e);
                            print("Incomplete Entries");
                          }
                        },
                        child: const Text(
                          "Proceed to App",
                          style: TextStyle(
                              fontSize: 22, fontStyle: FontStyle.italic),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

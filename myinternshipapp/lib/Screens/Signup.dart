import 'package:flutter/material.dart';
import 'package:myinternshipapp/Screens/HomeScreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _gender;
  String? _country;
  String? _state;
  String? _city;

  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> countries = ['India', 'USA', 'Canada'];
  final Map<String, List<String>> states = {
    'India': ['Gujarat', 'Maharashtra', 'Rajasthan'],
    'USA': ['California', 'Texas', 'New York'],
    'Canada': ['Ontario', 'Quebec', 'British Columbia']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: const Text(
                    "Enter The Following Details to get Started with the App",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Full Name*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    errorBorder: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email ID*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    errorBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Phone Number*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    errorBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{10}\$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.male),
                    hintText: "Gender*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    errorBorder: OutlineInputBorder(),
                  ),
                  value: _gender,
                  items: genders
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select your gender' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.living),
                    hintText: "Country*",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    errorBorder: OutlineInputBorder(),
                  ),
                  value: _country,
                  items: countries
                      .map((country) => DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _country = value;
                      _state = null;
                      _city = null;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select your country' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_country != null)
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.start_outlined),
                      hintText: "State*",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      errorBorder: OutlineInputBorder(),
                    ),
                    value: _state,
                    items: states[_country]!
                        .map((state) => DropdownMenuItem(
                              value: state,
                              child: Text(state),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _state = value;
                        _city = null;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select your state' : null,
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (_state != null)
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.start_rounded),
                      hintText: "City*",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      errorBorder: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _city = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 230, 223, 218),
                      backgroundColor: Colors.red),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the data
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Form Submitted'),
                          content: Text('All data is valid!'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Homescreen())),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert'; // For JSON decoding
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(
//     home: AuthPage(),
//   ));
// }

// class AuthPage extends StatefulWidget {
//   @override
//   _AuthPageState createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key for validation

//   String result = '';
//   bool isLoading = false;
//   bool isLoginMode = true; // To toggle between Login and Signup

//   // Function to handle user login/signup
//   Future<void> submitForm() async {
//     if (!_formKey.currentState!.validate()) {
//       return; // If form is not valid, do nothing
//     }

//     setState(() {
//       isLoading = true;
//       result = '';
//     });

//     final url = Uri.parse(
//       isLoginMode ? 'http://192.168.18.35:3000/api/auth/login' : 'http://192.168.18.35:3000/api/auth/signup',
//     );

//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'email': emailController.text,
//           'password': passwordController.text,
//           if (!isLoginMode) 'name': nameController.text, // Include name for signup
//         }),
//       );

//       setState(() {
//         isLoading = false;
//       });

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final responseData = json.decode(response.body);
//         setState(() {
//           result = responseData['message'] ?? 'Success';
//             Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => TodoPage(email: emailController.text)),
//         );
//         });
//       } else {
//         final responseData = json.decode(response.body);
//         setState(() {
//           result = responseData['error'] ?? 'Something went wrong';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//         result = 'Something went wrong: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(isLoginMode ? 'Login' : 'Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey, // Associate the form key
//           child: Column(
//             children: <Widget>[
//               if (!isLoginMode)
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   // Simple email validation
//                   if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
//                     return 'Please enter a valid email address';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: isLoading ? null : submitForm, // Disable when loading
//                 child: isLoading
//                     ? CircularProgressIndicator(color: Colors.white)
//                     : Text(isLoginMode ? 'Login' : 'Sign Up'),
//               ),
//               SizedBox(height: 20),
//               Text(result, style: TextStyle(color: Colors.red)),
//               SizedBox(height: 20),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     isLoginMode = !isLoginMode; // Toggle between login and signup
//                   });
//                 },
//                 child: Text(
//                   isLoginMode
//                       ? 'Don\'t have an account? Sign Up'
//                       : 'Already have an account? Login',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




















// // import 'dart:convert'; // For JSON decoding
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // void main() {
// //   runApp(MaterialApp(
// //     home: AuthPage(),
// //   ));
// // }

// // class AuthPage extends StatefulWidget {
// //   @override
// //   _AuthPageState createState() => _AuthPageState();
// // }

// // class _AuthPageState extends State<AuthPage> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController nameController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key for validation

// //   String result = '';
// //   bool isLoading = false;
// //   bool isLoginMode = true; // To toggle between Login and Signup

// //   // Function to handle user login/signup
// //   Future<void> submitForm() async {
// //     if (!_formKey.currentState!.validate()) {
// //       return; // If form is not valid, do nothing
// //     }

// //     setState(() {
// //       isLoading = true;
// //       result = '';
// //     });

// //     final url = Uri.parse(
// //       isLoginMode ? 'http://192.168.18.35:3000/api/auth/login' : 'http://192.168.18.35:3000/api/auth/signup',
// //     );

// //     try {
// //       final response = await http.post(
// //         url,
// //         headers: {'Content-Type': 'application/json'},
// //         body: json.encode({
// //           'email': emailController.text,
// //           'password': passwordController.text,
// //           if (!isLoginMode) 'name': nameController.text, // Include name for signup
// //         }),
// //       );

// //       setState(() {
// //         isLoading = false;
// //       });

// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         final responseData = json.decode(response.body);
// //         setState(() {
// //           result = responseData['message'] ?? 'Success';
// //         });

// //         // Navigate to Todo Page after successful login/signup
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => TodoPage(email: emailController.text)),
// //         );
// //       } else {
// //         final responseData = json.decode(response.body);
// //         setState(() {
// //           result = responseData['error'] ?? 'Something went wrong';
// //         });
// //       }
// //     } catch (e) {
// //       setState(() {
// //         isLoading = false;
// //         result = 'Something went wrong: $e';
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text(isLoginMode ? 'Login' : 'Sign Up')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey, // Associate the form key
// //           child: Column(
// //             children: <Widget>[
// //               if (!isLoginMode)
// //                 TextFormField(
// //                   controller: nameController,
// //                   decoration: InputDecoration(labelText: 'Name'),
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Please enter your name';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               TextFormField(
// //                 controller: emailController,
// //                 decoration: InputDecoration(labelText: 'Email'),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your email';
// //                   }
// //                   // Simple email validation
// //                   if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
// //                     return 'Please enter a valid email address';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               TextFormField(
// //                 controller: passwordController,
// //                 obscureText: true,
// //                 decoration: InputDecoration(labelText: 'Password'),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter a password';
// //                   }
// //                   if (value.length < 6) {
// //                     return 'Password must be at least 6 characters';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: isLoading ? null : submitForm, // Disable when loading
// //                 child: isLoading
// //                     ? CircularProgressIndicator(color: Colors.white)
// //                     : Text(isLoginMode ? 'Login' : 'Sign Up'),
// //               ),
// //               SizedBox(height: 20),
// //               Text(result, style: TextStyle(color: Colors.red)),
// //               SizedBox(height: 20),
// //               TextButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     isLoginMode = !isLoginMode; // Toggle between login and signup
// //                   });
// //                 },
// //                 child: Text(
// //                   isLoginMode
// //                       ? 'Don\'t have an account? Sign Up'
// //                       : 'Already have an account? Login',
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// class TodoPage extends StatefulWidget {
//   final String email;
//   TodoPage({required this.email});

//   @override
//   _TodoPageState createState() => _TodoPageState();
// }

// class _TodoPageState extends State<TodoPage> {
//   final TextEditingController _todoController = TextEditingController();
//   List<String> _todos = [];
//   bool isLoading = false;

// Future<void> addTodo() async {
//   setState(() {
//     isLoading = true;
//   });

//   try {
//     final response = await http.post(
//       Uri.parse('http://192.168.18.35:3000/api/todos'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'email': widget.email,
//         'todoItem': _todoController.text,
//       }),
//     );

//     setState(() {
//       isLoading = false;
//     });

//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
      
//       // Ensure we get the 'todos' in the response
//       if (responseData['todos'] != null) {
//         setState(() {
//           _todos = List<String>.from(responseData['todos']);
//           _todoController.clear();  // Clear input field after adding
//         });
//       } else {
//         print('Error: ${responseData['error']}');
//       }
//     } else {
//       print('Error: ${response.body}');
//     }
//   } catch (e) {
//     setState(() {
//       isLoading = false;
//     });
//     print('Error: $e');
//   }
// }

//   // Fetch Todo List Function
//   Future<void> fetchTodos() async {
//     final response = await http.get(
//       Uri.parse('http://192.168.18.35:3000/api/todos?email=${widget.email}'),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         _todos = List<String>.from(json.decode(response.body)['todos']);
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchTodos(); // Fetch todos when the page is loaded
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Todo Page')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _todoController,
//               decoration: InputDecoration(labelText: 'Add Todo'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: isLoading ? null : addTodo,
//               child: isLoading
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text('Add Todo'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _todos.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_todos[index]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:crud/login.dart';
import 'package:crud/signup.dart';
import 'package:crud/todo.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      initialRoute: '/signup',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/todo': (context) => TodoPage(),
      },
    );
  }
}

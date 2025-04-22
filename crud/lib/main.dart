import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat API App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> messages = [];
  bool isLoading = true;

Future<void> fetchMessages() async {
  final url = Uri.parse('https://skillbuddy-3hd8ltybx-kehan321s-projects.vercel.app/api');
  try {
    final response = await http.get(url);

    // Check if the response is successful
    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      setState(() {
        messages = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load messages');
    }
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    print("Error: $e");
    throw Exception('Failed to load messages');
  }
}

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Messages')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ListTile(
                  title: Text(msg['sender']),
                  subtitle: Text(msg['message']),
                  leading: CircleAvatar(child: Text(msg['sender'][0])),
                );
              },
            ),
    );
  }
}

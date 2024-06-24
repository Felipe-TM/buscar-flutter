import 'package:flutter/material.dart';
import 'chat_title.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> conversations = [
    {"name": "Felipe Torres", "avatar": "assets/thiago_avatar.png", "gender": "male"},
    {"name": "Roberto Arcanjo", "avatar": "assets/roberto_avatar.png", "gender": "male"},
    {"name": "Manoel Neto", "avatar": "assets/manoel_avatar.png", "gender": "male"},
    {"name": "Andressa Santos", "avatar": "assets/andressa_avatar.png", "gender": "female"},
    {"name": "Jade Cristina", "avatar": "assets/jade_avatar.png", "gender": "female"}
  ];

  ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundImage: AssetImage(conversations[index]['avatar']),
              child: _buildGenderIcon(conversations[index]['gender'], size: 28),
              radius: 24,
            ),
            title: Text(
              conversations[index]['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatTitle(title: conversations[index]['name']),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildGenderIcon(String gender, {double size = 24}) {
    IconData iconData = gender == "male" ? Icons.person : Icons.person_outline;
    return Icon(iconData, color: gender == "male" ? Colors.blue : Colors.pink, size: size);
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatScreen(),
  ));
}

import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/anh.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Kiều Anh',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            color: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text(
                'Change Password',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Handle change password logic
              },
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            color: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                // Handle logout logic
              },
            ),
          ),
        ],
      ),
    );
  }
}
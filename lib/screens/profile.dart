import 'package:flutter/material.dart';
import 'package:travel_app/screens/explore.dart';
import 'package:travel_app/screens/home.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'Chin_Shan';
  String emailId = 'ChinShan@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor:  Color(0xFFE7EBEE),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              SizedBox(height: 20),
              Text('User Name: $userName'),
              SizedBox(height: 10),
              Text('Email Id: $emailId'),
              SizedBox(height: 40),
              Column(
                children: [
                  _buildRowWithIconAndText(Icons.account_box, 'Account Status'),
                  SizedBox(height: 10),
                  _buildRowWithIconAndText(Icons.phone, 'Mobile: 9876543210'),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );

                      if (result != null && result is Map<String, String>) {
                        setState(() {
                          userName = result['name'] ?? userName;
                          emailId = result['email'] ?? emailId;
                        });
                      }
                    }, 
                    child: _buildRowWithIconAndText(Icons.edit, 'Edit Profile'),
                  ),
                  SizedBox(height: 10),
                  _buildRowWithIconAndText(Icons.payment, 'Payments'),
                  SizedBox(height: 10),
                  _buildRowWithIconAndText(Icons.settings, 'Settings'),
                  SizedBox(height: 10),
                  _buildRowWithIconAndText(Icons.logout, 'Logout'),
                ],
              ),
            ],
          ),
        ),
      ),
  bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Color.fromARGB(213, 97, 182, 238),
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'explore',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
  selectedItemColor: Color.fromARGB(255, 9, 52, 133),
  unselectedItemColor: Color.fromARGB(255, 9, 52, 133),
  onTap: (index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExplorePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  },
),


    );
  }

  Widget _buildRowWithIconAndText(IconData icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            SizedBox(width: 3),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFFE7EBEE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              
                String newName = _nameController.text;
                String newEmail = _emailController.text;
            
                Navigator.pop(context, {'name': newName, 'email': newEmail});
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
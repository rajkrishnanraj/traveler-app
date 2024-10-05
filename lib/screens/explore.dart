import 'package:flutter/material.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/profile.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: ExploreContent(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(213, 97, 182, 238),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
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
}

class ExploreContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exploreData.length,
      itemBuilder: (context, index) {
        return ExploreCard(destination: exploreData[index]);
      },
    );
  }
}

class ExploreCard extends StatelessWidget {
  final Destination destination;

  ExploreCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              destination.imageUrl, 
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  destination.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Destination {
  final String title;
  final String description;
  final String imageUrl;

  Destination({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}


List<Destination> exploreData = [
  Destination(
    title: 'Beach Paradise',
    description: 'Explore beautiful beaches around the world.',
    imageUrl: 'assets/images/beach.jpg',
  ),
  Destination(
    title: 'Mountain Adventure',
    description: 'Experience the thrill of mountain climbing.',
    imageUrl: 'assets/images/mountain.jpg',
  ),
  Destination(
    title: 'City Exploration',
    description: 'Discover vibrant cities with rich culture.',
    imageUrl: 'assets/images/richcity.jpg',
  ),
];

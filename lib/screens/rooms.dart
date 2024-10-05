import 'package:flutter/material.dart';

class ForeignHotelBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foreign Hotel Booking'),
      ),
      body: HotelList(),
    );
  }
}

class HotelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return HotelCard(hotel: hotels[index]);
          },
        );
      },
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                hotel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  hotel.location,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${hotel.price} per night',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                  
                    print('Book Now pressed for ${hotel.name}');
                  },
                  child: Text('Book Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Hotel {
  final String name;
  final String location;
  final String imageUrl;
  final double price;

  Hotel({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.price,
  });
}


List<Hotel> hotels = [
  Hotel(
    name: 'Luxury Hotel',
    location: 'Paris, France',
    imageUrl: 'assets/images/hotel.jpg',
    price: 250.0,
  ),
  Hotel(
    name: 'Seaside Resort',
    location: 'Maldives',
    imageUrl: 'assets/images/maldives.jpg',
    price: 350.0,
  ),
  Hotel(
    name: 'Mountain Lodge',
    location: 'Swiss Alps',
    imageUrl: 'assets/images/mountainlodge.jpg',
    price: 200.0,
  ),
  Hotel(
    name: 'City View Hotel',
    location: 'New York, USA',
    imageUrl: 'assets/images/cityview.jpg',
    price: 300.0,
  ),
];

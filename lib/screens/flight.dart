import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlightBookingScreen(),
    );
  }
}

class FlightBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Your Flight',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                FlightSearchForm(),
                SizedBox(height: 20),
                Expanded(
                  child: FlightList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FlightSearchForm extends StatefulWidget {
  @override
  _FlightSearchFormState createState() => _FlightSearchFormState();
}

class _FlightSearchFormState extends State<FlightSearchForm> {
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _departureDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextFormField(
            controller: _originController,
            decoration: InputDecoration(
              labelText: 'Origin',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextFormField(
            controller: _destinationController,
            decoration: InputDecoration(
              labelText: 'Destination',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextFormField(
            controller: _departureDateController,
            decoration: InputDecoration(
              labelText: 'Departure Date',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null && pickedDate != DateTime.now()) {
                _departureDateController.text =
                    "${pickedDate.toLocal()}".split(' ')[0];
              }
            },
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
           
          },
          child: Text('Search Flights'),
        ),
      ],
    );
  }
}

class FlightList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 4, 
      itemBuilder: (context, index) {
        return FlightCard();
      },
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text('Flight Number  "BA 222" British Airways service'),
        subtitle: Text('Departure: 11:30, Arrival: 09:00'),
        trailing: ElevatedButton(
          onPressed: () {
          },
          child: Text('Book Now'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Machine'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg-3.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: BookingWidget(),
        ),
      ),
    );
  }
}

class BookingWidget extends StatefulWidget {
  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  String studentName = '';
  String roomNumber = '';
  String selectedDay = 'Monday';
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedMachineType = 'Washing Machine';
  String selectedMachineNumber = '1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              studentName = value;
            },
            decoration: InputDecoration(
              labelText: 'Student Name',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              roomNumber = value;
            },
            decoration: InputDecoration(
              labelText: 'Room Number',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Select Machine Type:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          DropdownButton<String>(
            value: selectedMachineType,
            onChanged: (String? newValue) {
              setState(() {
                selectedMachineType = newValue!;
              });
            },
            items: <String>['Washing Machine', 'Dryer']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
            'Select Machine Number:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          DropdownButton<String>(
            value: selectedMachineNumber,
            onChanged: (String? newValue) {
              setState(() {
                selectedMachineNumber = newValue!;
              });
            },
            items: <String>['1', '2', '3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
            'Select Day:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          DropdownButton<String>(
            value: selectedDay,
            onChanged: (String? newValue) {
              setState(() {
                selectedDay = newValue!;
              });
            },
            items: <String>[
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday',
              'Sunday'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
            'Choose Time:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              _selectTime(context);
            },
            child: Text('Choose Time: ${selectedTime.format(context)}'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _showConfirmationDialog(context);
            },
            child: Text('Book Machine'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Student: $studentName'),
                Text('Room Number: $roomNumber'),
                Text('Day: $selectedDay'),
                Text('Time: ${selectedTime.format(context)}'),
                Text('Machine Type: $selectedMachineType'),
                Text('Machine Number: $selectedMachineNumber'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

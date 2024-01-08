import 'package:flutter/material.dart';

class AvailabilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machine Availability'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: MachineAvailabilityWidget(),
      ),
    );
  }
}

class MachineStatusItem extends StatelessWidget {
  final String type;
  final String machineNumber;
  final String status;

  MachineStatusItem({
    required this.type,
    required this.machineNumber,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('$type $machineNumber'),
        subtitle: Text('Status: $status'),
      ),
    );
  }
}

class MachineAvailabilityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Machine Availability',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              MachineStatusItem(
                  type: 'Washing Machine', machineNumber: '1', status: 'Free'),
              MachineStatusItem(
                  type: 'Washing Machine',
                  machineNumber: '2',
                  status: 'In Use'),
              MachineStatusItem(
                  type: 'Washing Machine',
                  machineNumber: '3',
                  status: 'In Use'),
              MachineStatusItem(
                  type: 'Dryer', machineNumber: '1', status: 'In Use'),
              MachineStatusItem(
                  type: 'Dryer', machineNumber: '2', status: 'Free'),
              MachineStatusItem(
                  type: 'Dryer', machineNumber: '3', status: 'Free'),
            ],
          ),
        ),
      ],
    );
  }
}

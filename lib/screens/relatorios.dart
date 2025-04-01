import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  final List<Map<String, dynamic>> reports = [
    {
      'title': 'Manutenções Realizadas',
      'value': 25,
      'icon': Icons.build,
      'color': Colors.blue,
    },
    {
      'title': 'Máquinas em Operação',
      'value': 10,
      'icon': Icons.settings,
      'color': Colors.green,
    },
    {
      'title': 'Máquinas Paradas',
      'value': 2,
      'icon': Icons.error,
      'color': Colors.red,
    },
    {
      'title': 'Peças em Falta',
      'value': 3,
      'icon': Icons.warning,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Relatórios')),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(report['icon'], color: report['color'], size: 40),
              title: Text(
                report['title'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                report['value'].toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: report['color'],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

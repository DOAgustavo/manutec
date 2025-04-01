import 'package:flutter/material.dart';

class MaintenanceSchedulePage extends StatelessWidget {
  final List<Map<String, dynamic>> maintenanceSchedule = [
    {
      'equipment': 'Máquina A',
      'date': DateTime(2025, 4, 10),
      'responsible': 'João Silva',
    },
    {
      'equipment': 'Máquina B',
      'date': DateTime(2025, 4, 15),
      'responsible': 'Maria Oliveira',
    },
    {
      'equipment': 'Máquina C',
      'date': DateTime(2025, 4, 20),
      'responsible': 'Carlos Santos',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agenda de Manutenções')),
      body: ListView.builder(
        itemCount: maintenanceSchedule.length,
        itemBuilder: (context, index) {
          final maintenance = maintenanceSchedule[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.blue),
              title: Text(
                'Equipamento: ${maintenance['equipment']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Data: ${maintenance['date'].day.toString().padLeft(2, '0')}/'
                '${maintenance['date'].month.toString().padLeft(2, '0')}/'
                '${maintenance['date'].year}\n'
                'Responsável: ${maintenance['responsible']}',
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Exibe um diálogo com os detalhes da manutenção
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Detalhes da Manutenção'),
                      content: Text(
                        'Equipamento: ${maintenance['equipment']}\n'
                        'Data: ${maintenance['date'].day.toString().padLeft(2, '0')}/'
                        '${maintenance['date'].month.toString().padLeft(2, '0')}/'
                        '${maintenance['date'].year}\n'
                        'Responsável: ${maintenance['responsible']}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

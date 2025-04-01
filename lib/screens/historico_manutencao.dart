import 'package:flutter/material.dart';

class HistoricoManutencaoPage extends StatelessWidget {
  final List<Map<String, dynamic>> maintenanceHistory = [
    {
      'equipment': 'Máquina A',
      'date': DateTime(2025, 3, 15),
      'service': 'Troca de peças',
      'responsible': 'João Silva',
    },
    {
      'equipment': 'Máquina B',
      'date': DateTime(2025, 3, 20),
      'service': 'Lubrificação',
      'responsible': 'Maria Oliveira',
    },
    {
      'equipment': 'Máquina C',
      'date': DateTime(2025, 3, 25),
      'service': 'Ajuste técnico',
      'responsible': 'Carlos Santos',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Manutenção')),
      body: ListView.builder(
        itemCount: maintenanceHistory.length,
        itemBuilder: (context, index) {
          final history = maintenanceHistory[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.build, color: Colors.blue),
              title: Text(
                'Equipamento: ${history['equipment']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Data: ${history['date'].day.toString().padLeft(2, '0')}/'
                '${history['date'].month.toString().padLeft(2, '0')}/'
                '${history['date'].year}\n'
                'Serviço: ${history['service']}\n'
                'Responsável: ${history['responsible']}',
              ),
            ),
          );
        },
      ),
    );
  }
}

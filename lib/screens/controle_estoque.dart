import 'package:flutter/material.dart';

class InventoryControlPage extends StatelessWidget {
  final List<Map<String, dynamic>> inventory = [
    {'item': 'Parafuso M10', 'quantity': 50, 'minimum': 20},
    {'item': 'Óleo Lubrificante', 'quantity': 10, 'minimum': 5},
    {
      'item': 'Correia Transportadora',
      'quantity': 0,
      'minimum': 1,
    }, // Item em falta
    {'item': 'Filtro de Ar', 'quantity': 3, 'minimum': 5}, // Estoque baixo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Controle de Estoque')),
      body: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          final item = inventory[index];
          final isLowStock = item['quantity'] < item['minimum'];
          final isOutOfStock =
              item['quantity'] == 0; // Verifica se está em falta
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(
                isOutOfStock
                    ? Icons
                        .error // Ícone para item em falta
                    : isLowStock
                    ? Icons
                        .warning // Ícone para estoque baixo
                    : Icons.check_circle, // Ícone para estoque adequado
                color:
                    isOutOfStock
                        ? Colors
                            .red // Cor para item em falta
                        : isLowStock
                        ? Colors
                            .orange // Cor para estoque baixo
                        : Colors.green, // Cor para estoque adequado
              ),
              title: Text(
                item['item'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Quantidade: ${item['quantity']}\n'
                'Mínimo Necessário: ${item['minimum']}',
              ),
              trailing:
                  isOutOfStock
                      ? Text(
                        'Faltando',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : isLowStock
                      ? Text(
                        'Estoque Baixo',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
          );
        },
      ),
    );
  }
}

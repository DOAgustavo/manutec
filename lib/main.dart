import 'package:flutter/material.dart';
import 'package:manutec/screens/registro_manutencao.dart';
import 'package:manutec/screens/agenda_manutencao.dart';
import 'package:manutec/screens/historico_manutencao.dart';
import 'package:manutec/screens/controle_estoque.dart';
import 'package:manutec/screens/relatorios.dart';

void main() {
  runApp(ManutecApp());
}

class ManutecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manutec - Gestão de Manutenção',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manutec - Gestão de Manutenção')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Registro de Manutenções'),
            subtitle: Text('Registrar quem fez, quando e o tipo de serviço.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MaintenanceLogScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Agenda de Manutenções'),
            subtitle: Text('Ver próximas manutenções e notificações.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MaintenanceSchedulePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code),
            title: Text('Histórico de Manutenção'),
            subtitle: Text('Escanear QR Code e ver histórico.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoricoManutencaoPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('Controle de Estoque'),
            subtitle: Text('Gerenciar peças e materiais necessários.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InventoryControlPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Relatórios'),
            subtitle: Text('Acompanhar status das máquinas.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MaintenanceLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Manutenções')),
      body: Center(child: Text('Página para registrar manutenções.')),
    );
  }
}

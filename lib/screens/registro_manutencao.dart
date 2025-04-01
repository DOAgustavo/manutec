import 'package:flutter/material.dart';

class MaintenanceLogScreen extends StatefulWidget {
  @override
  _MaintenanceLogScreenState createState() => _MaintenanceLogScreenState();
}

class _MaintenanceLogScreenState extends State<MaintenanceLogScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _responsiblePerson;
  String? _serviceType;
  DateTime? _selectedDate;

  void _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aqui você pode salvar os dados no banco de dados ou backend
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Manutenção registrada com sucesso!')),
      );
      // Limpar o formulário
      setState(() {
        _responsiblePerson = null;
        _serviceType = null;
        _selectedDate = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Manutenções')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Responsável'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do responsável.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _responsiblePerson = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tipo de Serviço'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o tipo de serviço.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _serviceType = value;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child:
                        _selectedDate == null
                            ? Text('Nenhuma data selecionada')
                            : Text(
                              'Data: ${_selectedDate!.day.toString().padLeft(2, '0')}/'
                              '${_selectedDate!.month.toString().padLeft(2, '0')}/'
                              '${_selectedDate!.year}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                  ),
                  ElevatedButton(
                    onPressed: () => _pickDate(context),
                    child: Text('Selecionar Data'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Registrar Manutenção'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

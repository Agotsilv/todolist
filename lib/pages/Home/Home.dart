import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaDeTarefas = ["Ir ao mercado", "Ir a academia", "Estudar"];

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text('Todo List'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaDeTarefas.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                    title: Text(_listaDeTarefas[index]),
                    selected: _selected,
                    value: _selected,
                    onChanged: (valor) {
                      setState(() {
                        _selected = valor!;
                      });
                    });
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    decoration: InputDecoration(labelText: "Digite sua tarefa"),
                    onChanged: (text) {},
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancelar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: Text("Adicionar"),
                    )
                  ],
                );
              });
        },
        label: Text("Adicioanar Task"),
        elevation: 5,
        icon: Icon(Icons.add),
      ),
    );
  }
}

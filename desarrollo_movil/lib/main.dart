import 'package:desarrollo_movil/Student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name = 'Nieobe';
  int edad = 21;
  bool progra = true;

  final Student student = Student("Jaqueline Nieobe Hernandez Bernal", "20223tn57");
  List<Student> studentList = [];

  final TextEditingController _txtName = TextEditingController();
  

  final TextEditingController _txtStudentId = TextEditingController();

  

  void _incrementCounter() {
    setState(() {
      //boton que agrega
      _counter++;
    });
  }

  Widget _getAllStudents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Text("Students list:"),
        const SizedBox(height: 8),
        ...studentList.map((s) => Text("- ${s.name} (${s.studentId})")).toList(),
      ],
    );
  }

  @override
  void dispose() {
    _txtName.dispose();
    _txtStudentId.dispose();
    super.dispose();
  }

  void _addStudents() {
    final name = _txtName.text.trim();
    final studentId = _txtStudentId.text.trim();

    if (name.isEmpty || studentId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("El nombre y el ID no pueden estar vacíos")),
      );
      return;
    }
    setState(() {
      studentList.add(Student(name, studentId));
    });
    _txtName.clear();
    _txtStudentId.clear();
  }

  void _removeCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _txtName,
                decoration: InputDecoration(
                  labelText: "Name: ",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _txtStudentId,
                decoration: InputDecoration(
                  labelText: "Matricula: ",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                onPressed: _addStudents,
                child: Text("Add student"),
              ),
            ),
            SizedBox(height: 15),
            Text('Nombre: $name'),
            Text('Edad: $edad'),
            Text('Si se pudo?: $progra'),
            Text("Student1: ${student.name}"),
            Text("Student id: ${student.studentId}"),
                _getAllStudents(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _removeCounter,
            tooltip: 'Remove',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
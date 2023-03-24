import 'package:django_flutter/student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Connect Flutter with Django',
      home: Scaffold(body: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Student studentService = Student();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: FutureBuilder<List>(
            future: studentService.getAllStudents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              print("${snapshot}yyyyyyyyyyy");
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          snapshot.data[index]['stuname'].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        subtitle: Text(
                          snapshot.data[index]['email'].toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No Data"),
                );
              }
            },
          ),
        ));
  }
}

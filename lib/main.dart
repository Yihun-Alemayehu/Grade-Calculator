import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textController = TextEditingController();
  String finalGrade = '';

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Grade Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                  hintText: 'Enter your mark here...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          TextButton(
            onPressed: () {
              final mark = int.parse(textController.text);
              String output = getGrade(mark);

              setState(() {
                finalGrade = output;
              });
            },
            child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black,
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          finalGrade.isEmpty
              ? Container(
                  height: 50,
                  width: 250,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      'Your Grade will appear here ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 50,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                    ' Your Grade is $finalGrade',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
        ],
      ),
    );
  }

  String getGrade(int markOf) {
    //final int markOf = mark;
    late final String grade;
    if (markOf > 90) {
      grade = 'A';
    } else if (markOf > 80) {
      grade = 'B';
    } else if (markOf > 70) {
      grade = 'C';
    } else if (markOf > 60) {
      grade = 'D';
    } else if (markOf < 60) {
      grade = 'F';
    }

    return grade;
  }
}

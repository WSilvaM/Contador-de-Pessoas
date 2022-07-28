import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;

  void decrement() {
    setState(() {
      cont--;
    });
    print(cont);
  }

  void increment() {
    setState(() {
      cont++;
    });

    print(cont);
  }

  bool get isEmpty => cont == 0;
  bool get isfull => cont == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Hello Word',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.pink,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/unnamed.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isfull ? 'Limite Maximo ' : 'Contador de Pessoas!',
              style: TextStyle(
                  color: isfull ? Colors.red : Colors.black, fontSize: 25),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              cont.toString(),
              style: TextStyle(
                  color: isfull
                      ? Colors.red
                      : const Color.fromARGB(255, 51, 50, 50),
                  fontSize: 100),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isfull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isfull
                        ? Colors.white.withOpacity(0.2)
                        : Color.fromARGB(255, 51, 50, 50),
                    fixedSize: const Size(100, 100),
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    //padding: const EdgeInsets.all(20),
                  ),
                  child: Text(
                    'Entrou',
                    style: TextStyle(
                        color: isfull ? Colors.black : Colors.white,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty
                        ? Colors.white.withOpacity(0.2)
                        : Color.fromARGB(255, 51, 50, 50),
                    fixedSize: const Size(100, 100),
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Saiu',
                    style: TextStyle(
                        color: isEmpty ? Colors.black : Colors.white,
                        fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

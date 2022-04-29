import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int interessados = 0;
int interessadosTotal = 0;

String interessadosText =
    "O número de pessoas interessadas desde nossa última atualização é: 0";
String interessadosTotalText = "O total de pessoas interessadas foi: 0";

void Interessados() {
  SetState() {
    interessados += 1;
    interessadosTotal += 1;

    interessadosText =
        "O número de pessoas interessadas desde nossa última atualização é:" +
            interessados.toString();
    interessadosTotalText =
        "O total de pessoas interessadas foi:" + interessadosTotal.toString();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Páginas infinitas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              interessadosTotalText,
            ),
            Text(
              interessadosText,
            ),
            const Text(
              '',
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Não há página anterior'),
                      ),
                    )
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    child: Text("anterior"),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SafeArea(
                                child: Pagina1(title: "Página 1"))))
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    child: Text("próxima"),
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

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pagina 1',
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    child: Text("anterior"),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SafeArea(
                                child: Pagina2(title: "Página 2"))))
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    child: Text("próxima"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatefulWidget {
  const Pagina2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pagina 2',
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    child: Text("anterior"),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Site em expansão'),
                        content:
                            const Text('Deseja votar para o site expandir?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Não'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                {Navigator.pop(context, 'Sim'), Interessados()},
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    // Change button text when light changes state.
                    child: Text("próxima"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

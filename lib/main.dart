import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xFF838383),
          accentColor: Color(0xFF1a1a1a),
          scaffoldBackgroundColor: Color(0xFF333333)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final screnns = [
    Center(
      child: Text(
        'Buscar',
        style: TextStyle(fontSize: 60),
      ),
    ),
    Center(
      child: Text(
        'Inicio',
        style: TextStyle(fontSize: 60),
      ),
    ),
    Center(
      child: Text(
        'QR',
        style: TextStyle(fontSize: 60),
      ),
    )
  ];

  void _onChange(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screnns,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        currentIndex: _currentIndex,
        iconSize: 40,
        selectedFontSize: 20,
        unselectedFontSize: 16,
        onTap: (index) => _onChange(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR',
          )
        ],
      ), 
    );
  }
}

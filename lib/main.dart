import 'package:flutter/material.dart';
import 'package:networking/pages/crypt.dart';
import 'package:networking/pages/currency.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мой Flutter App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/crypto': (context) => CryptoPage(),
        '/currency': (context) => CurrencyPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text('API APP'),
      ),
      backgroundColor: Color(0xFF494F55),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/crypto');
            },
            child: Container(
              padding: EdgeInsets.all(25.0),
              color: Colors.black26,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.currency_bitcoin,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Криптовалюта',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/currency');
            },
            child: Container(
              padding: EdgeInsets.all(25.0),
              color: Colors.black26,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.attach_money,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Валюта',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

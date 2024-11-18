import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => FontNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) {
          return MaterialApp(
            title: 'Multi Theme & Font App',
            theme: themeNotifier.themeData,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Consumer<FontNotifier>(
        builder: (context, fontNotifier, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello, Flutter!',
                  style: fontNotifier.textStyle.copyWith(fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Text('Go to Settings'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Choose Theme'),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .setTheme(ThemeData.light()); // Tema Terang
            },
            child: Text('Light Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .setTheme(ThemeData.dark()); // Tema Gelap
            },
            child: Text('Dark Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false).setTheme(
                ThemeData(
                  primaryColor: Colors.green, // Warna utama hijau
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    secondary: Colors.green, // Warna sekunder hijau
                  ),
                  buttonTheme:
                      ButtonThemeData(buttonColor: Colors.green), // Tombol hijau
                  scaffoldBackgroundColor: Colors.green[50], // Latar belakang hijau muda
                  textTheme: TextTheme(
                    bodyLarge: TextStyle(color: Colors.green),
                  ),
                ),
              );
            },
            child: Text('Green Theme'),
          ),
          SizedBox(height: 20),
          Text('Choose Font'),
          ElevatedButton(
            onPressed: () {
              // Mengubah font menjadi Roboto
              Provider.of<FontNotifier>(context, listen: false).setFont('Roboto');
            },
            child: Text('Roboto'),
          ),
          ElevatedButton(
            onPressed: () {
              // Mengubah font menjadi Lora
              Provider.of<FontNotifier>(context, listen: false).setFont('Lora');
            },
            child: Text('Lora'),
          ),
          ElevatedButton(
            onPressed: () {
              // Mengubah font menjadi OpenSans
              Provider.of<FontNotifier>(context, listen: false).setFont('OpenSans');
            },
            child: Text('OpenSans'),
          ),
        ],
      ),
    );
  }
}

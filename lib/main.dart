import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Data App with Tabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Menghilangkan label debug
      home: TabScreen(),
    );
  }
}

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Data'), // Mengubah judul menjadi "Open Data"
        centerTitle: true, // Memindahkan teks ke tengah
        backgroundColor: Colors.teal, // Mengubah warna AppBar menjadi teal
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Windows'),
            Tab(text: 'Home'),
            Tab(text: 'Help'),
            Tab(text: 'About'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal, // Mengubah warna header drawer menjadi teal
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Mengubah warna latar belakang body menjadi abu-abu
        child: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text('Welcome to Windows', style: TextStyle(fontSize: 24))),
            Center(child: Text('Welcome to Home', style: TextStyle(fontSize: 24))),
            Center(child: Text('Welcome to Help', style: TextStyle(fontSize: 24))),
            Center(child: Text('Welcome to About', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}

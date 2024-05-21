import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (_controller.text.length == 6 &&
        RegExp(r'^\d{6}$').hasMatch(_controller.text)) {}
  }

  void _navigateToScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedLabelStyle: const TextStyle(color: Colors.black54),
        selectedLabelStyle: const TextStyle(color: Colors.blueAccent),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Bids',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'KP0237',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

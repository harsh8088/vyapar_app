import 'package:flutter/material.dart';
import 'package:vyapar_app/home/portfolio.dart';
import 'package:vyapar_app/home/watchlist/watchlist.dart';

import 'account.dart';
import 'bids.dart';
import 'orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ExpansionTileController controller = ExpansionTileController();
  final PageController pageController = PageController(initialPage: 0);

  int _selectedIndex = 0;

  // Create a tab controller
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the Tab Controller
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [WatchList(), Orders(), Portfolio(), Bids(), Account()],
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedLabelStyle: const TextStyle(color: Colors.black54),
          selectedLabelStyle: const TextStyle(color: Colors.blueAccent),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline_sharp),
              label: 'Watchlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_sharp),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cases_outlined),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.colorize_outlined),
              label: 'Bids',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'KP0237',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black54,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          icon: Icon(Icons.favorite),
        ),
        Tab(
          icon: Icon(Icons.adb),
        ),
        Tab(
          icon: Icon(Icons.airport_shuttle),
        ),
      ],
      // setup the controller
      controller: tabController,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: tabController,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }
}

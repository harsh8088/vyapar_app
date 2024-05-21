import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ExpansionTileController controller = ExpansionTileController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              // Provide a standard title.
              title: const Row(
                children: [
                  Text("Watchlist"),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 36,
                  )
                ],
              ),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: Container(
                color: Colors.grey.shade300,
              ),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 60,
            ),
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => ListTile(title: Text('Item #$index')),
                // Builds 20 ListTiles
                childCount: 20,
              ),
            ),
          ],
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
    });
  }
}

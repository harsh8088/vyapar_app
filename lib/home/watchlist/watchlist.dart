import 'package:flutter/material.dart';
import 'package:vyapar_app/home/watchlist/items.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              "Watchlist",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 36,
              color: Colors.black87,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent),
          child: TabBar(
            onTap: _onItemTapped,
            indicatorColor: Colors.blueAccent,
            unselectedLabelColor: Colors.black87,
            labelColor: Colors.blueAccent,
            dividerHeight: 0,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: const <Tab>[
              Tab(
                text: "Consumer Staples",
              ),
              Tab(
                text: "Energy",
              ),
              Tab(
                text: "FMCG",
              ),
              Tab(
                text: "Healthcare",
              ),
              Tab(
                text: "Finance & Service",
              ),
              Tab(
                text: "RealEstate",
              ),
              Tab(
                text: "Materials",
              ),
            ],
            controller: tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items()
            ],
          ),
        )
      ],
    );
  }

  Widget _customScrollView() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          // Provide a standard title.
          title: const Row(
            children: [
              Text(
                "Watchlist",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 36,
                color: Colors.black87,
              )
            ],
          ),
          // Allows the user to reveal the app bar if they begin scrolling
          // back up the list of items.
          floating: true,
          // Display a placeholder widget to visualize the shrinking size.
          flexibleSpace: Container(
            color: Colors.grey.shade200,
          ),
          // Make the initial height of the SliverAppBar larger than normal.
          expandedHeight: 60,
        ),
        SliverList(
          // Use a delegate to build items as they're scrolled on screen.
          delegate: SliverChildBuilderDelegate(
            // The builder function returns a ListTile with a title that
            // displays the index of the current item.
            (context, index) => ListView(
              children: [
                TabBar(
                  tabs: <Tab>[
                    Tab(
                      // set icon to the tab
                      text: "Consumer Staples",
                    ),
                    Tab(
                      text: "Energy",
                    ),
                    Tab(
                      text: "FMCG",
                    ),
                    Tab(
                      text: "Healthcare",
                    ),
                    Tab(
                      text: "Finance & Service",
                    ),
                    Tab(
                      text: "RealEstate",
                    ),
                    Tab(
                      text: "Materials",
                    ),
                  ],
                  controller: tabController,
                )
              ],
            ),
            // Builds 20 ListTiles
            childCount: 1,
          ),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      // tabController.index
      // pageController.jumpToPage(index);
    });
  }
}

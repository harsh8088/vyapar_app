import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _WatchListState();
}

class _WatchListState extends State<Items> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              children: [
                const Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TRENT",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("NSE  140",
                        style: TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                )),
                const Spacer(),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "23,054.24",
                      style: TextStyle(
                          color: Colors.redAccent.shade400, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text("-11.95 (-1.59%)", style: TextStyle(fontSize: 10))
                  ],
                ))
              ],
            ),
          ));
        },
        separatorBuilder: (context, index) =>
            const Divider(height: 0.5, color: Colors.grey),
        itemCount: 30);
  }
}

import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({super.key});

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
                    Wrap(
                      children: [
                        Text("Qty.  ",
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        Text(
                          "140",
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(" • ", style: TextStyle(fontSize: 11)),
                        Text("Avg.  ",
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        Text(
                          "140",
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "TRENT",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Wrap(children: [
                      Text(
                        "Invested  ",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      Text(
                        "20,941.25",
                        style: TextStyle(fontSize: 11),
                      )
                    ])
                  ],
                )),
                const Spacer(),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "+126.73%",
                      style: TextStyle(
                          color: Colors.green.shade400, fontSize: 11),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "+26,538.75",
                      style: TextStyle(
                          color: Colors.green.shade400, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                     Wrap(children: [
                      Text(
                        "LTP  ",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      Text(
                        "474.80 ",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "(+0.34%)",
                        style: TextStyle(
                            color: Colors.green.shade400, fontSize: 11),
                      ),
                    ])
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

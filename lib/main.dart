import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
                ),
                Container(
                  width: 1,
                  color: Colors.black,
                ),
                Text("data"),
                Container(
                  width: 1,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            padding: const EdgeInsets.all(6),
            tabs: [Text("Reward Card"), Text("Payment Cardssss")],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(
                        "$index",
                        style: TextStyle(color: Colors.amber),
                      );
                    },
                  ),
                ),
                Container(height: 50, width: 50, color: Colors.red),
              ],
            ),
          )
        ],
      ),
    );
  }
}

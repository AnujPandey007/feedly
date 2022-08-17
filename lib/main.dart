import 'dart:developer';

import 'package:feedly/services.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    final HttpService httpService = HttpService();

    return Scaffold(
      appBar: AppBar(
        title: Text("All Feeds"),
      ),
      body: FutureBuilder(
        future: httpService.getFeeds(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if (snapshot.hasData) {
            List<Feed> feeds = snapshot.data;

            if(feeds==null){
              return const Center(
                child: Text("No Data"),
              );
            }
            return ListView.builder(
                itemCount: feeds.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: Text("${(feeds[index].engagement/1000).toInt().toString()}K"),
                    title: Text(feeds[index].title),
                    subtitle: Text(feeds[index].origin.toString()),
                  );
                }
            );
          } else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        },
      ),
    );
  }

}
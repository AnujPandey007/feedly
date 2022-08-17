import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'feed.dart';

class HttpService {

  Future<List<Feed>> getFeeds() async {
    var bbc = 'https://cloud.feedly.com/v3/mixes/contents?streamId=feed%2Fhttp%3A%2F%2Fnewsrss.bbc.co.uk%2Frss%2Fnewsonline_world_edition%2Ffront_page%2Frss.xml';
    var newsweek = 'https://cloud.feedly.com/v3/mixes/contents?streamId=feed%2Fhttp%3A%2F%2Fwww.newsweek.com%2Frss';
    var cnn = 'https://cloud.feedly.com/v3/mixes/contents?streamId=feed%2Fhttp%3A%2F%2Frss.cnn.com%2Frss%2Fcnn_world.rss';
    var wpost = 'https://cloud.feedly.com/v3/mixes/contents?streamId=feed%2Fhttp%3A%2F%2Fwww.washingtonpost.com%2Frss%2Fhomepage';

    var token = "Bearer TOKEN_ID";

    try{

      var response = await http.get(
        Uri.parse(bbc),
        headers: {"Authorization": token},
      );
      var body = response.body;
      var list = jsonDecode(body)["items"] as List;
      List<Feed> feeds = list.map((i) {
        // log("Item: ${i}");
        return Feed.fromJson(i);
      }).toList();

      var response2 = await http.get(
        Uri.parse(newsweek),
        headers: {"Authorization": token},
      );
      var body2 = response2.body;
      var list2 = jsonDecode(body2)["items"] as List;
      List<Feed> feeds2 = list2.map((i) {
        // log("Item: ${i}");
        return Feed.fromJson(i);
      }).toList();

      var response3 = await http.get(
        Uri.parse(cnn),
        headers: {"Authorization": token},
      );
      var body3 = response3.body;
      var list3 = jsonDecode(body3)["items"] as List;
      List<Feed> feeds3 = list3.map((i) {
        // log("Item: ${i}");
        return Feed.fromJson(i);
      }).toList();

      var response4 = await http.get(
        Uri.parse(wpost),
        headers: {"Authorization": token},
      );
      var body4 = response4.body;
      var list4 = jsonDecode(body4)["items"] as List;
      List<Feed> feeds4 = list4.map((i) {
        // log("Item: ${i}");
        return Feed.fromJson(i);
      }).toList();

      feeds.addAll(feeds2);
      feeds.addAll(feeds3);
      feeds.addAll(feeds4);

      return feeds;
    }catch(e){
      throw "Error";
    }

  }

}
import 'dart:convert';
import 'dart:developer';


class Feed {
  String title;
  int engagement;
  double engagementRate;
  // String featuredMeme;
  String origin;

  Feed({
    required this.title,
    required this.engagement,
    required this.engagementRate,
    // required this.featuredMeme,
    required this.origin,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    log(json["origin"]["title"]);
    return Feed(
      title: json["title"],
      engagement: json["engagement"],
      engagementRate: json["engagementRate"],
      // featuredMeme: json["featuredMeme"]["label"]??"",
      origin: json["origin"]["title"]??"",
    );
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "engagement": engagement,
    "engagementRate": engagementRate,
    // "featuredMeme": featuredMeme,
    "origin": origin,
  };
}
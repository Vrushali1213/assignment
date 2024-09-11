
import 'dart:convert';

List<JobListJson> userFromJson(String str) => List<JobListJson>.from(json.decode(str).map((x) => JobListJson.fromJson(x)));

class JobListJson {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  bool? isApplied=false;

  JobListJson({this.albumId, this.id, this.title, this.url, this.thumbnailUrl, this.isApplied});

  JobListJson.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
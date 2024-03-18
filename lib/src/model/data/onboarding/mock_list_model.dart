import 'dart:convert';

class MockListModel {
  bool? status;
  String? message;
  List<Mylist>? mylist;

  MockListModel({this.status, this.message, this.mylist});

  MockListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['mylist'] != null) {
      mylist = [];
      json['mylist'].forEach((v) {
        mylist!.add(Mylist.fromJson(v));
      });
    }
  }

  //Use this when response is in string format
  factory MockListModel.fromString(String source) =>
      MockListModel.fromJson(json.decode(source));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (mylist != null) {
      data['mylist'] = mylist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mylist {
  int? id;
  String? title;
  String? subTitle;

  Mylist({this.id, this.title, this.subTitle});

  Mylist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subTitle'] = subTitle;
    return data;
  }
}
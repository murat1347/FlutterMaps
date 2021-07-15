import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:odakarge/isaretler.dart';

Future<List<Isaretler>?> getAllIsaretler() async {
  var url = "http://81.213.157.105:1212/api/Deneme/ListGroup";
  final getIsaretler = await http.get(Uri.parse(url));
  final List responseBody = jsonDecode(getIsaretler.body);
  final list= responseBody.map((e) => Isaretler.fromJson(e)).toList();
  return list;
}


 getLength() async {
  var url = "http://81.213.157.105:1212/api/Deneme/ListGroup";
  final getIsaretler = await http.get(Uri.parse(url));
  final List responseBody = jsonDecode(getIsaretler.body);
  return responseBody.length;
}
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:opentrivia/models/category.dart';
import 'package:opentrivia/models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions(Category category, int? total, String? difficulty) async {
  String url = "$baseUrl?amount=$total&category=17";
  if(difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }
  http.Response res = await http.get(Uri.parse(url));
  List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);
  return Question.fromData(questions);
}
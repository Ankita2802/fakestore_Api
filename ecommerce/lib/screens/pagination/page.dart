import 'dart:convert';
import 'dart:math';

import 'package:ecommerce/model/pageModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  @override
  void initState() {
    fetchPost(offset);
    handlenext();
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  List post = [];
  bool loading = true;
  List<Result> result = [];
  int offset = 0;
  Future<void> fetchPost(paraoffset) async {
    print(paraoffset);
    final url =
        "https://pokeapi.co/api/v2/pokemon?offset=${paraoffset}&limit=15";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      //expected response
      final json = jsonDecode(response.body);
      print(json);
      PageModel pageModel = PageModel.fromJson(json);
      result = result + pageModel.results;
      int localoffset = offset + 15;
      setState(() {
        result;
        loading = false;
        offset = localoffset;
      });
    } else {
      //unexpected response
    }
  }

  void handlenext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        fetchPost(offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagination Data"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: index % 2 == 0 ? Colors.teal : Colors.yellowAccent,
            title: Text(result[index].name),
            subtitle: Text(
              result[index].url,
              maxLines: 1,
            ),
          );
        },
      ),
    );
  }
}

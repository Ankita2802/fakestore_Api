import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioGetScreen extends StatefulWidget {
  const DioGetScreen({super.key});

  @override
  State<DioGetScreen> createState() => _DioGetScreenState();
}

class _DioGetScreenState extends State<DioGetScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  var jsondata;
  Future<void> getData() async {
    try {
      var response = await Dio()
          .get('https://protocoderspoint.com/jsondata/superheros.json');
      if (response.statusCode == 200) {
        setState(() {
          jsondata = response.data['superheros'] as List;
          debugPrint(jsondata);
        });
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: jsondata == null ? 0 : jsondata.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.network(jsondata[index]['url'])),
            title: Text(jsondata[index]['name']),
            subtitle: Text(jsondata[index]['']),
          );
        },
      ),
    );
  }
}

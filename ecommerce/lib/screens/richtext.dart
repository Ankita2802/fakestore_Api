import 'package:flutter/material.dart';

class RichTextScreen extends StatefulWidget {
  const RichTextScreen({super.key});

  @override
  State<RichTextScreen> createState() => _RichTextScreenState();
}

class _RichTextScreenState extends State<RichTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rich text example"),
        centerTitle: true,
      ),
      body: Center(
        child: RichText(
          text: const TextSpan(
              text: "First",
              style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
              children: <TextSpan>[
                TextSpan(
                    text: "Second",
                    style: TextStyle(color: Colors.blue, fontSize: 18.0)),
                TextSpan(
                    text: "Third",
                    style: TextStyle(color: Colors.yellow, fontSize: 18.0)),
                TextSpan(
                    text: "Fourth",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 18.0))
              ]),
        ),
      ),
    );
  }
}

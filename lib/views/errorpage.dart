import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String errormeg;

  const ErrorPage({Key? key, required this.errormeg}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ERROR: ${widget.errormeg}"),
    );
  }
}

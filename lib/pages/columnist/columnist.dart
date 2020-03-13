import 'package:flutter/material.dart';

class ColumnistPage extends StatefulWidget {
  @override
  _ColumnistPageState createState() => _ColumnistPageState();
}

class _ColumnistPageState extends State<ColumnistPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Text("专栏"),
      )),
    );
  }
}

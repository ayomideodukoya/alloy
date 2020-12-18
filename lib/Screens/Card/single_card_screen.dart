import 'package:flutter/material.dart';

class SingleCardScreen extends StatefulWidget {
  @override
  _SingleCardScreenState createState() => _SingleCardScreenState();
}

class _SingleCardScreenState extends State<SingleCardScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}

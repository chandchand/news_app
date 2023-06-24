import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

Widget buildLoadingWidget() {
  return const Center(
    child: Column(
      children: [CupertinoActivityIndicator()],
    ),
  );
}

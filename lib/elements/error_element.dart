import 'package:flutter/material.dart';

Widget buildErrorWidget(String error) {
  // ignore: avoid_unnecessary_containers
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          error,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

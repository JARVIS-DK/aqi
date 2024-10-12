import 'package:flutter/material.dart';

PreferredSizeWidget buildCustomAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(50)),
          child: const Text(
            "Eco Air",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
    ),
  );
}

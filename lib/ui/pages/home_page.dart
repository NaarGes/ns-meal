import 'package:flutter/material.dart';
import 'package:ns_meal/config/routes/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Pages.home.toTitle),
        ),
      ),
    );
  }
}

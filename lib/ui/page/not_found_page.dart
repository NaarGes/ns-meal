import 'package:flutter/material.dart';
import 'package:ns_meal/config/routes/pages.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Pages.notFound.toTitle),
        ),
      ),
    );
  }
}

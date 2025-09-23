import 'package:flutter/material.dart';

class ScrollToTopExample extends StatefulWidget {
  const ScrollToTopExample({super.key});

  @override
  _ScrollToTopExampleState createState() => _ScrollToTopExampleState();
}

class _ScrollToTopExampleState extends State<ScrollToTopExample> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scroll to Top Demo')),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            if (scrollNotification.metrics.pixels > 300) {
              // لو اسكرول بعيد عن الأعلى
              setState(() {
                _showBackToTopButton = true;
              });
            } else {
              setState(() {
                _showBackToTopButton = false;
              });
            }
          }
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        ),
      ),
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

class ScrollNotificationExample extends StatefulWidget {
  const ScrollNotificationExample({super.key});

  @override
  _ScrollNotificationExampleState createState() =>
      _ScrollNotificationExampleState();
}

class _ScrollNotificationExampleState extends State<ScrollNotificationExample> {
  double scrollPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationListener Example'),
        backgroundColor: Colors.blue.withOpacity(
          scrollPosition > 100 ? 1.0 : scrollPosition / 100,
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              scrollPosition = scrollNotification.metrics.pixels;
            });
          }
          return true; // منع الانتشار للأعلى
        },
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog_widget/NotificationListener/scroll_to_top_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ScrollConfigExample(),
    );
  }
}

class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // إلغاء تأثير الـ Glow الأزرق
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // نجعل الاسكرول أسلس شوية
    return const BouncingScrollPhysics();
  }
}

class ScrollConfigExample extends StatelessWidget {
  const ScrollConfigExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scrollable Example')),
      body: Scrollable(
        axisDirection: AxisDirection.down,
        viewportBuilder: (context, position) {
          return Column(
            children: List.generate(
              30,
              (index) => Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                color: Colors.blue[100],
                child: Text('Item $index'),
              ),
            ),
          );
        },
      ),
    );
  }
}

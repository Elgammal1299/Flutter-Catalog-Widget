import 'package:flutter/material.dart';

class CollapsingAppBarPage extends StatelessWidget {
  const CollapsingAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // يثبت AppBar بعد الانكماش
            expandedHeight: 200, // ارتفاع AppBar قبل الانكماش
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('عنوان الصفحة'),
              background: Image.network(
                'https://picsum.photos/600/400',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('عنصر ${index + 1}')),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}

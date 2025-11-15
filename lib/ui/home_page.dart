import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';
import '/state/navigation_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationProvider);

    const pages = [
      PageOne(),
      PageTwo(),
      PageThree(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter App')),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => ref.read(navigationProvider.notifier).state = index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Page 1'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Page 2'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Page 3'),
        ],
      ),
    );
  }
}

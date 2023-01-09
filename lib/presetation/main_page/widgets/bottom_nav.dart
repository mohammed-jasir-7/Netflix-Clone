import 'package:flutter/material.dart';

ValueNotifier<int> indexnotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexnotifier,
      builder: (context, index, child) => BottomNavigationBar(
          onTap: (index) => indexnotifier.value = index,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: "New & Hot"),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions), label: "Fast Laughs"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: "Downloads"),
          ]),
    );
  }
}

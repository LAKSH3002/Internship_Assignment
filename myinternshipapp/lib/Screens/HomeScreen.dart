import 'package:flutter/material.dart';
import 'package:myinternshipapp/Screens/Audioplayer.dart';
import 'package:myinternshipapp/Screens/FetchedScreen.dart';
import 'package:myinternshipapp/Screens/newaudioplayer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const FetchedScreen(),
    AudioPlayerScreen(),
    NewAudioPlayerScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_rounded),
            label: 'Audio page2',
          ),
        ],
      ),
    );
  }
}

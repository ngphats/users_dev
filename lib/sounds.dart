import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Sounds'),
        ),
        body: const Sounds(),
      ),
    );
  }
}

class Sounds extends StatefulWidget {
  const Sounds({super.key});

  @override
  State<Sounds> createState() => _SoundsState();
}

class _SoundsState extends State<Sounds> {
  Widget buildKey(key, value) {
    return Center(
      child: TextButton(
        onPressed: () {
          final assetsAudioPlayer = AssetsAudioPlayer();
          assetsAudioPlayer.open(
            Audio('sounds/$value'),
          );
        },
        child: Container(
          height: 80.0,
          width: 500.0,
          color: Colors.blueGrey[200],
          margin: const EdgeInsets.all(2.0),
          child: Text('$key'),
        ),
      ),
    );
  }

  List<Widget> getNoteLs() {
    Map lsNote = {
      'note1': 'note1.wav',
      'note2': 'note2.wav',
      'note3': 'note3.wav',
      'note4': 'note4.wav',
      'note5': 'note5.wav',
      'note6': 'note6.wav',
      'note7': 'note7.wav'
    };

    List<Widget> results = [];
    lsNote.forEach((key, value) {
      Widget currentWidget = buildKey(key, value);
      results.add(currentWidget);
    });

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: getNoteLs(),
      ),
    );
  }
}

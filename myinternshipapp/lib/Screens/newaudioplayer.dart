import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class NewAudioPlayerScreen extends StatefulWidget {
  @override
  _NewAudioPlayerScreenState createState() => _NewAudioPlayerScreenState();
}

class _NewAudioPlayerScreenState extends State<NewAudioPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen to audio duration changes
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    // Listen to audio position changes
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    // Listen to when audio is completed
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration.zero;
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Now Playing',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Slider(
              min: 0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await _audioPlayer.seek(position);
                await _audioPlayer.resume();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(_position)),
                Text(formatTime(_duration)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 64,
                  onPressed: () async {
                    if (isPlaying) {
                      await _audioPlayer.pause();
                    } else {
                      await _audioPlayer
                          .play(AssetSource('assets/audio/Lakshaudio.mp3'));
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.stop),
                  iconSize: 64,
                  onPressed: () async {
                    await _audioPlayer.stop();
                    setState(() {
                      isPlaying = false;
                      _position = Duration.zero;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

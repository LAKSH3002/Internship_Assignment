import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_bloc.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_event.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_state.dart';

class AudioPlayerScreen extends StatefulWidget {
  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final audioBloc = BlocProvider.of<AudioPlayerBloc>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Audio Player', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state is AudioPlaying
                      ? 'Audio is Playing'
                      : state is AudioPaused
                          ? 'Audio is Paused'
                          : state is AudioStopped
                              ? 'Audio is Stopped'
                              : 'Press Play to Start Audio',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => audioBloc.add(PlayAudio()),
                      child: const Text('Play'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => audioBloc.add(PauseAudio()),
                      child: const Text('Pause'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => audioBloc.add(StopAudio()),
                      child: const Text('Stop'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

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
    final audioBloc = context.read<AudioPlayerBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Audio Player')),
      body: Center(
        child: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is AudioPlayerInitial || state is AudioPlayerStopped)
                  Text('Audio Stopped'),
                if (state is AudioPlayerPlaying)
                  Text('Audio Playing'),
                if (state is AudioPlayerPaused)
                  Text('Audio Paused'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => audioBloc.add(PlayAudio()),
                      child: Text('Play'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => audioBloc.add(PauseAudio()),
                      child: Text('Pause'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => audioBloc.add(StopAudio()),
                      child: Text('Stop'),
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
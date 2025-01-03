// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myinternshipapp/Audio_bloc/Audio_bloc.dart';
// import 'package:myinternshipapp/Audio_bloc/Audio_event.dart';
// import 'package:myinternshipapp/Audio_bloc/Audio_state.dart';

// class AudioPlayerScreen extends StatefulWidget
// {
//   @override
//   State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
// }

// class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final audioBloc = context.read<AudioPlayerBloc>();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 247, 169, 97),
//         centerTitle: true,
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Internship ',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Assignment        ',
//               style: TextStyle(
//                   color: Color.fromARGB(255, 232, 234, 236),
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       body:
//       Center(
//         child: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
//           builder: (context, state) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (state is AudioPlayerInitial || state is AudioPlayerStopped)
//                   Text('Audio is not playing'),
//                 if (state is AudioPlayerPlaying)
//                   Text('Audio is Playing'),
//                 if (state is AudioPlayerPaused)
//                   Text('Audio is Paused'),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => audioBloc.add(PlayAudio()),
//                       child: Text('Play'),
//                     ),
//                     SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () => audioBloc.add(PauseAudio()),
//                       child: Text('Pause'),
//                     ),
//                     SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () => audioBloc.add(StopAudio()),
//                       child: Text('Stop'),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_bloc.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_event.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_state.dart';

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 106, 106),
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Internship ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Assignment        ',
              style: TextStyle(
                  color: Color.fromARGB(255, 232, 234, 236),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => AudioPlayerBloc(),
        child: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
          builder: (context, state) {
            final audioPlayerBloc = context.read<AudioPlayerBloc>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is AudioPlayerPlaying)
                  Text('Audio is Playing...', style: TextStyle(fontSize: 28)),
                if (state is AudioPlayerPaused)
                  Text('Audio is Paused', style: TextStyle(fontSize: 28)),
                if (state is AudioPlayerStopped || state is AudioPlayerInitial)
                  Text('Audio is Stopped', style: TextStyle(fontSize: 28)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        audioPlayerBloc.add(PlayAudio());
                      },
                      child: Text('Play Music'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        audioPlayerBloc.add(PauseAudio());
                      },
                      child: Text('Pause'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        audioPlayerBloc.add(StopAudio());
                      },
                      child: Text('Stop Music'),
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

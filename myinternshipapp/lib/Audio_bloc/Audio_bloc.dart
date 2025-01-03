import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_event.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_state.dart';

// Audio Player Bloc
class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayerBloc() : super(AudioPlayerInitial()) {
    on<PlayAudio>((event, emit) async {
      await _audioPlayer.play(AssetSource('assets/audio/Lakshaudio.mp3'));
      emit(AudioPlayerPlaying());
    });

    on<PauseAudio>((event, emit) async {
      await _audioPlayer.pause();
      emit(AudioPlayerPaused());
    });

    on<StopAudio>((event, emit) async {
      await _audioPlayer.stop();
      emit(AudioPlayerStopped());
    });
  }
}
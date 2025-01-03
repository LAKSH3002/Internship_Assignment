import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_event.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayerBloc() : super(AudioPlayerInitial()) {
    on<PlayAudio>((event, emit) async {
      try {
        await _audioPlayer.play(AssetSource('assets/audio/audio.mp3'));
      } catch (e) {
        print('Error playing audio: $e');
      }
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

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}

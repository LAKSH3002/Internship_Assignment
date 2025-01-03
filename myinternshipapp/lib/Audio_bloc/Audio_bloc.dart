// Audio Player Bloc
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_event.dart';
import 'package:myinternshipapp/Audio_bloc/Audio_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioPlayer _audioPlayer;

  AudioPlayerBloc(this._audioPlayer) : super(AudioInitial()) {
    on<PlayAudio>((event, emit) async {
      await _audioPlayer.play(AssetSource('assets/audio/Laksh_audio.mp3'));
      emit(AudioPlaying());
    });

    on<PauseAudio>((event, emit) async {
      await _audioPlayer.pause();
      emit(AudioPaused());
    });

    on<StopAudio>((event, emit) async {
      await _audioPlayer.stop();
      emit(AudioStopped());
    });
  }
}

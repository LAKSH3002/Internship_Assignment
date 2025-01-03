// Audio Player State
abstract class AudioPlayerState {}

class AudioPlayerInitial extends AudioPlayerState {}
class AudioPlayerPlaying extends AudioPlayerState {}
class AudioPlayerPaused extends AudioPlayerState {}
class AudioPlayerStopped extends AudioPlayerState {}
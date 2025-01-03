// Audio Player States
abstract class AudioPlayerState {}

class AudioInitial extends AudioPlayerState {}

class AudioPlaying extends AudioPlayerState {}

class AudioPaused extends AudioPlayerState {}

class AudioStopped extends AudioPlayerState {}
// Audio Player Event
abstract class AudioPlayerEvent {}

class PlayAudio extends AudioPlayerEvent {}
class PauseAudio extends AudioPlayerEvent {}
class StopAudio extends AudioPlayerEvent {}
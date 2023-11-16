import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final playlistProvider = StateProvider<String>((ref) {
  return '';
});

final audioPlayerProvider = StateProvider.autoDispose<AudioPlayer>((ref) {
  final audioPlayer = AudioPlayer();
  final playlist = ref.watch(playlistProvider);
  audioPlayer.setUrl(playlist);
  print(playlist);
  return audioPlayer;
});

final currentlyPlayingProvider = StreamProvider.autoDispose<bool>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.playingStream;
});

final bufferedPlayerPosition = StreamProvider.autoDispose((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.bufferedPositionStream;
});
final totalDurationProvider = Provider.autoDispose<Duration>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.duration ?? Duration.zero;
});

final currentPositionProvider = StreamProvider.autoDispose<Duration>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.positionStream;
});

final playingStateProvider = StreamProvider.autoDispose<bool>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.playingStream;
});

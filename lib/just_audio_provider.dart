import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final playlistProvider = Provider((ref) => '');

final audioPlayerProvider = Provider.autoDispose<AudioPlayer>((ref) {
  final audioPlayer = AudioPlayer();
  final playlist = ref.watch(playlistProvider);

  audioPlayer.setUrl(playlist);
  return audioPlayer;
});

final currentlyPlayingProvider = StreamProvider.autoDispose<Duration>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.bufferedPositionStream;
});

final totalDurationProvider = StreamProvider.autoDispose<Duration>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.positionStream;
});

final currentPositionProvider = StreamProvider.autoDispose<Duration>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.positionStream;
});

final playingStateProvider = StreamProvider.autoDispose<bool>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.playingStream;
});

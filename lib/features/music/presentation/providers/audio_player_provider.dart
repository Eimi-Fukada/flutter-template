import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/di/injector.dart';
import 'package:flutter_template/features/music/domain/services/audio_player_service.dart';
import 'package:flutter_template/features/music/data/models/song_model.dart';

// 音频播放服务Provider
final audioPlayerServiceProvider = Provider<AudioPlayerService>((ref) {
  return getIt<AudioPlayerService>();
});

// 当前播放状态Provider
final currentSongProvider = StreamProvider<Song?>((ref) {
  final audioService = ref.watch(audioPlayerServiceProvider);
  return audioService.currentSong == null 
      ? Stream.value(null)
      : Stream.value(audioService.currentSong);
});

// 播放状态Provider
final isPlayingProvider = Provider<bool>((ref) {
  final audioService = ref.watch(audioPlayerServiceProvider);
  return audioService.isPlaying;
});

// 播放位置Provider
final playbackPositionProvider = Provider<Duration>((ref) {
  final audioService = ref.watch(audioPlayerServiceProvider);
  return audioService.position;
});

// 歌曲时长Provider
final songDurationProvider = Provider<Duration>((ref) {
  final audioService = ref.watch(audioPlayerServiceProvider);
  return audioService.duration;
});

// 播放列表Provider
final playlistProvider = Provider<List<Song>>((ref) {
  final audioService = ref.watch(audioPlayerServiceProvider);
  return audioService.playlist;
});

// 当前索引Provider
final currentIndexProvider = Provider<int>((ref) {
  final audioService = ref.watch(audioPlayerServiceProvider);
  return audioService.currentIndex;
});
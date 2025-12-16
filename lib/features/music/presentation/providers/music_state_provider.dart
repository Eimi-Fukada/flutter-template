import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/di/injector.dart';
import 'package:flutter_template/features/music/domain/services/audio_player_service.dart';
import 'package:flutter_template/features/music/data/models/song_model.dart';

// 音乐播放状态枚举
enum MusicPlaybackState {
  stopped,
  loading,
  playing,
  paused,
  completed,
}

// 音乐状态类
class MusicState {
  final Song? currentSong;
  final List<Song> playlist;
  final int currentIndex;
  final MusicPlaybackState playbackState;
  final Duration position;
  final Duration duration;
  final bool isLooping;
  final bool isShuffling;

  const MusicState({
    this.currentSong,
    this.playlist = const [],
    this.currentIndex = 0,
    this.playbackState = MusicPlaybackState.stopped,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.isLooping = false,
    this.isShuffling = false,
  });

  MusicState copyWith({
    Song? currentSong,
    List<Song>? playlist,
    int? currentIndex,
    MusicPlaybackState? playbackState,
    Duration? position,
    Duration? duration,
    bool? isLooping,
    bool? isShuffling,
  }) {
    return MusicState(
      currentSong: currentSong ?? this.currentSong,
      playlist: playlist ?? this.playlist,
      currentIndex: currentIndex ?? this.currentIndex,
      playbackState: playbackState ?? this.playbackState,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isLooping: isLooping ?? this.isLooping,
      isShuffling: isShuffling ?? this.isShuffling,
    );
  }

  bool get hasSong => currentSong != null;
  bool get isLoading => playbackState == MusicPlaybackState.loading;
  bool get isPlaying => playbackState == MusicPlaybackState.playing;
  bool get isPaused => playbackState == MusicPlaybackState.paused;
  bool get isStopped => playbackState == MusicPlaybackState.stopped;
  bool get isCompleted => playbackState == MusicPlaybackState.completed;
}

// 音乐状态管理器
class MusicStateNotifier extends StateNotifier<MusicState> {
  late final AudioPlayerService _audioService;

  MusicStateNotifier() : super(const MusicState()) {
    _audioService = getIt<AudioPlayerService>();
    _audioService.addListener(_onAudioServiceChanged);
    _initializeState();
  }

  void _initializeState() {
    state = state.copyWith(
      currentSong: _audioService.currentSong,
      playlist: _audioService.playlist,
      currentIndex: _audioService.currentIndex,
      position: _audioService.position,
      duration: _audioService.duration,
      playbackState: _audioService.isPlaying 
          ? MusicPlaybackState.playing 
          : MusicPlaybackState.stopped,
    );
  }

  void _onAudioServiceChanged() {
    state = state.copyWith(
      currentSong: _audioService.currentSong,
      playlist: _audioService.playlist,
      currentIndex: _audioService.currentIndex,
      position: _audioService.position,
      duration: _audioService.duration,
      playbackState: _getPlaybackState(),
    );
  }

  MusicPlaybackState _getPlaybackState() {
    if (_audioService.isLoading) return MusicPlaybackState.loading;
    if (_audioService.isPlaying) return MusicPlaybackState.playing;
    if (_audioService.currentSong == null) return MusicPlaybackState.stopped;
    return MusicPlaybackState.paused;
  }

  Future<void> playSong(Song song) async {
    state = state.copyWith(playbackState: MusicPlaybackState.loading);
    await _audioService.playSong(song);
  }

  Future<void> play() async {
    await _audioService.play();
  }

  Future<void> pause() async {
    await _audioService.pause();
  }

  Future<void> togglePlayPause() async {
    await _audioService.togglePlayPause();
  }

  Future<void> playNext() async {
    await _audioService.playNext();
  }

  Future<void> playPrevious() async {
    await _audioService.playPrevious();
  }

  Future<void> seekTo(Duration position) async {
    await _audioService.seekTo(position);
  }

  void setPlaylist(List<Song> songs, {int startIndex = 0}) {
    _audioService.setPlaylist(songs, startIndex: startIndex);
  }

  void toggleLoop() {
    // TODO: 实现循环功能
  }

  void toggleShuffle() {
    // TODO: 实现随机播放功能
  }

  @override
  void dispose() {
    _audioService.removeListener(_onAudioServiceChanged);
    super.dispose();
  }
}

// Provider
final musicStateProvider = StateNotifierProvider<MusicStateNotifier, MusicState>((ref) {
  return MusicStateNotifier();
});

// 便捷访问Provider
final currentSongProvider = Provider<Song?>((ref) {
  return ref.watch(musicStateProvider).currentSong;
});

final isPlayingProvider = Provider<bool>((ref) {
  return ref.watch(musicStateProvider).isPlaying;
});

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(musicStateProvider).isLoading;
});

final playbackPositionProvider = Provider<Duration>((ref) {
  return ref.watch(musicStateProvider).position;
});

final songDurationProvider = Provider<Duration>((ref) {
  return ref.watch(musicStateProvider).duration;
});

final playlistProvider = Provider<List<Song>>((ref) {
  return ref.watch(musicStateProvider).playlist;
});

final currentIndexProvider = Provider<int>((ref) {
  return ref.watch(musicStateProvider).currentIndex;
});
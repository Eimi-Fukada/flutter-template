import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_template/features/music/data/models/song_model.dart';

class AudioPlayerService extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  
  // 播放状态
  bool _isPlaying = false;
  bool _isLoading = false;
  Song? _currentSong;
  List<Song> _playlist = [];
  int _currentIndex = 0;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  
  // Getter
  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading;
  Song? get currentSong => _currentSong;
  List<Song> get playlist => _playlist;
  int get currentIndex => _currentIndex;
  Duration get duration => _duration;
  Duration get position => _position;
  
  // 构造函数
  AudioPlayerService() {
    _initialize();
    _setupPlayerListeners();
  }
  
  // 初始化
  Future<void> _initialize() async {
    try {
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());
      
      _player.playerStateStream.listen((state) {
        _isPlaying = state.playing;
        notifyListeners();
      });
      
      _player.positionStream.listen((position) {
        _position = position;
        notifyListeners();
      });
      
      _player.durationStream.listen((duration) {
        if (duration != null) {
          _duration = duration;
          notifyListeners();
        }
      });
      
    } catch (e) {
      debugPrint('AudioPlayerService 初始化失败: $e');
    }
  }
  
  // 设置播放器监听
  void _setupPlayerListeners() {
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        // 当前歌曲播放完成，播放下一首
        playNext();
      }
    });
  }
  
  // 设置播放列表
  void setPlaylist(List<Song> songs, {int startIndex = 0}) {
    _playlist = songs;
    _currentIndex = startIndex;
    notifyListeners();
  }
  
  // 播放指定歌曲
  Future<void> playSong(Song song) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      // 在实际应用中，这里应该是音频文件的URL
      // 现在我们使用本地assets文件
      await _player.setAsset('assets/audio/${song.audioUrl.isEmpty ? '1.mp3' : song.audioUrl}');
      
      _currentSong = song;
      await _player.play();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('播放歌曲失败: $e');
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // 播放/暂停
  Future<void> play() async {
    try {
      await _player.play();
    } catch (e) {
      debugPrint('播放失败: $e');
    }
  }
  
  Future<void> pause() async {
    try {
      await _player.pause();
    } catch (e) {
      debugPrint('暂停失败: $e');
    }
  }
  
  // 播放/暂停切换
  Future<void> togglePlayPause() async {
    if (_isPlaying) {
      await pause();
    } else {
      await play();
    }
  }
  
  // 播放下一首
  Future<void> playNext() async {
    if (_playlist.isEmpty) return;
    
    _currentIndex = (_currentIndex + 1) % _playlist.length;
    await playSong(_playlist[_currentIndex]);
  }
  
  // 播放上一首
  Future<void> playPrevious() async {
    if (_playlist.isEmpty) return;
    
    _currentIndex = (_currentIndex - 1 + _playlist.length) % _playlist.length;
    await playSong(_playlist[_currentIndex]);
  }
  
  // 跳转到指定位置
  Future<void> seekTo(Duration position) async {
    try {
      await _player.seek(position);
    } catch (e) {
      debugPrint('跳转失败: $e');
    }
  }
  
  // 设置播放模式（循环、随机等）
  Future<void> setLoopMode(LoopMode mode) async {
    try {
      await _player.setLoopMode(mode);
    } catch (e) {
      debugPrint('设置循环模式失败: $e');
    }
  }
  
  // 释放资源
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
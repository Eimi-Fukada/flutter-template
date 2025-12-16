import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/music/data/repositories/mock_music_repository.dart';
import 'package:flutter_template/features/music/presentation/widgets/song_list_widget.dart';
import 'package:flutter_template/features/music/presentation/widgets/playlist_grid_widget.dart';

class MusicPlayerPage extends ConsumerWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = MockMusicRepository.getSongs();

    return Scaffold(
      appBar: AppBar(
        title: const Text('音乐'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: 实现搜索功能
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 推荐歌单
            const PlaylistGridWidget(),
            const SizedBox(height: 24),
            
            // 歌曲列表
            SongListWidget(
              songs: songs,
              title: '推荐歌曲',
            ),
            const SizedBox(height: 100), // 为底部播放器留出空间
          ],
        ),
      ),
    );
  }
}
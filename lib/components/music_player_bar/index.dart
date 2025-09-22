import 'package:flutter/material.dart';

class MusicPlayerBar extends StatelessWidget {
  const MusicPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.music_note),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('正在播放', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('歌曲名称 - 歌手'),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              // 播放/暂停逻辑
            },
          ),
        ],
      ),
      
    );
  }
}

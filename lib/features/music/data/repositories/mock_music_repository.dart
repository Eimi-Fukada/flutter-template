import 'package:flutter_template/features/music/data/models/song_model.dart';

class MockMusicRepository {
  // 模拟歌曲数据
  static List<Song> getSongs() {
    return [
      Song(
        id: '1',
        title: '夜曲',
        artist: '周杰伦',
        album: '十一月的萧邦',
        duration: '3:46',
        imageUrl: '',
        audioUrl: '1.mp3',
      ),
      Song(
        id: '2',
        title: '晴天',
        artist: '周杰伦',
        album: '叶惠美',
        duration: '4:29',
        imageUrl: '',
        audioUrl: '2.mp3',
      ),
      Song(
        id: '3',
        title: '告白气球',
        artist: '周杰伦',
        album: '周杰伦的床边故事',
        duration: '3:35',
        imageUrl: '',
        audioUrl: '1.mp3',
      ),
      Song(
        id: '4',
        title: '七里香',
        artist: '周杰伦',
        album: '七里香',
        duration: '4:59',
        imageUrl: '',
        audioUrl: '2.mp3',
      ),
      Song(
        id: '5',
        title: '稻香',
        artist: '周杰伦',
        album: '魔杰座',
        duration: '3:43',
        imageUrl: '',
        audioUrl: '1.mp3',
      ),
      Song(
        id: '6',
        title: '青花瓷',
        artist: '周杰伦',
        album: '我很忙',
        duration: '3:57',
        imageUrl: '',
        audioUrl: '2.mp3',
      ),
    ];
  }
  
  // 模拟歌单数据
  static List<Map<String, dynamic>> getPlaylists() {
    return [
      {
        'id': '1',
        'title': '我喜欢的音乐',
        'description': '收藏的喜欢的歌曲',
        'songCount': 12,
        'coverUrl': '',
      },
      {
        'id': '2',
        'title': '轻音乐',
        'description': '放松身心的音乐',
        'songCount': 25,
        'coverUrl': '',
      },
      {
        'id': '3',
        'title': '运动音乐',
        'description': '适合运动的节奏感强的音乐',
        'songCount': 18,
        'coverUrl': '',
      },
      {
        'id': '4',
        'title': '学习专注',
        'description': '适合学习和工作的背景音乐',
        'songCount': 30,
        'coverUrl': '',
      },
    ];
  }
}
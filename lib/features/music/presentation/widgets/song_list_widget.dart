import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/music/data/models/song_model.dart';
import 'package:flutter_template/features/music/presentation/providers/music_state_provider.dart';

class SongListWidget extends ConsumerWidget {
  final List<Song> songs;
  final String title;

  const SongListWidget({
    super.key,
    required this.songs,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicState = ref.watch(musicStateProvider);
    final musicStateNotifier = ref.watch(musicStateProvider.notifier);
    final currentSong = musicState.currentSong;
    final isPlaying = musicState.isPlaying;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            final isCurrentSong = currentSong?.id == song.id;

            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isCurrentSong ? Colors.red.withOpacity(0.1) : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: isCurrentSong && isPlaying
                    ? const Icon(Icons.play_arrow, color: Colors.red)
                    : song.imageUrl.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              song.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => 
                                  const Icon(Icons.music_note, color: Colors.grey),
                            ),
                          )
                        : const Icon(Icons.music_note, color: Colors.grey),
              ),
              title: Text(
                song.title,
                style: TextStyle(
                  fontWeight: isCurrentSong ? FontWeight.bold : FontWeight.normal,
                  color: isCurrentSong ? Colors.red : null,
                ),
              ),
              subtitle: Text(song.artist),
              trailing: isCurrentSong && isPlaying
                  ? const Icon(Icons.equalizer, color: Colors.red)
                  : const Icon(Icons.more_vert),
              onTap: () {
                musicStateNotifier.setPlaylist(songs, startIndex: index);
                musicStateNotifier.playSong(song);
              },
            );
          },
        ),
      ],
    );
  }
}
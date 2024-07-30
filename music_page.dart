import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final List<Song> songs = [
    Song(
      title: 'Darling',
      artist: 'Bad Bunny',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlCBS7lZmB_55EgjpMnwKrYwzlqX9V0HcQfg&s',
      audioUrl: 'https://soundcloud.com/user-315261990/darling-tiktok-speed-up-just?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing',
    ),
    Song(
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn5ZgKcZHJvEgMbZ9lbXQbUQ-tL7Or3hU4zA&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    ),
    Song(
      title: 'Save Your Tears',
      artist: 'The Weeknd',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1hyUbZPrvs3Te6ENxdG3lOk4ogvOlZtb7OA&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
    ),
    Song(
      title: 'Levitating',
      artist: 'Dua Lipa',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbk5SHm8-Ed6LFrvHXOEizpy4oDh6PkiFO5w&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
    ),
    Song(
      title: 'Good 4 U',
      artist: 'Olivia Rodrigo',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-d5eLf5-wFHGpiZOB-zU8HrTtgs9n3nEJeA&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
    ),
    Song(
      title: 'Peaches',
      artist: 'Justin Bieber',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcQdBPEsjv2UOAjPSxhVRuJ6JArjTtw24dug&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3',
    ),
    Song(
      title: 'Kiss Me More',
      artist: 'Doja Cat',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-9FdA75-I8gdo8OQZT8FRhJVR4k2UpCPaxw&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3',
    ),
    Song(
      title: 'Montero (Call Me By Your Name)',
      artist: 'Lil Nas X',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfTmc1C8Aynk9aW5_dE2nNcUnpUtP4HDfQEg&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3',
    ),
    Song(
      title: 'Leave The Door Open',
      artist: 'Bruno Mars',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNaZ1qxGYaWZBHwZuQMQc_Y9Dx1MPX_D7EqQ&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3',
    ),
    Song(
      title: 'Deja Vu',
      artist: 'Olivia Rodrigo',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhP0zg-KH7tI1r51EOGY2SyPyxLlQbKAdVcg&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3',
    ),
    Song(
      title: 'Drivers License',
      artist: 'Olivia Rodrigo',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw7POBL15vPyrpWqtH0NpG4oyH3Ah8uKsz2A&s',
      audioUrl: 'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3',
    ),
    // Add more songs here
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AudioProvider>(context, listen: false).setPlaylist(songs);
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.psychologs.com/wp-content/uploads/2023/12/The-Psychology-behind-your-spotify-wrapped-551x431.jpg'),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 190, left: 20),
                          child: ListTile(
                            title: Text(
                              audioProvider.currentSong?.title ?? '',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              audioProvider.currentSong?.artist ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 2, 8, 36),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 71.0),
                            child: const Text(
                              'Playlist',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: songs.length,
                              itemBuilder: (context, index) {
                                final song = songs[index];
                                return GestureDetector(
                                  onTap: () {
                                    audioProvider.playSong(song);
                                  },
                                  child: _buildSongItem(
                                    imageUrl: song.imageUrl,
                                    title: song.title,
                                    subtitle: song.artist,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 385,
            left: 30,
            right: 3,
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 18, 49),
                ),
                onPressed: () {
                  if (audioProvider.isPlaying) {
                    audioProvider.pauseSong();
                  } else {
                    audioProvider.resumeSong();
                  }
                },
                child: Icon(
                    color: Colors.white,
                    audioProvider.isPlaying ? Icons.pause : Icons.play_arrow),
              ),
            ),
          ),
          Positioned(
            top: 355,
            left: 30,
            right: 20,
            child: ProgressBar(
              thumbColor: Colors.white,
              progressBarColor: Colors.white,
              bufferedBarColor: Colors.grey,
              baseBarColor: Colors.white,
              progress: audioProvider.position,
              total: audioProvider.duration,
              onSeek: (duration) {
                audioProvider.seek(duration);
              },
            ),
          ),
          Positioned(
            top: 385,
            left: 100,
            child: IconButton(
              onPressed: () {
                audioProvider.playPrevious();
              },
              icon: Icon(Icons.skip_previous, color: Colors.white, size: 29),
            ),
          ),
          Positioned(
            top: 385,
            left: 235,
            child: IconButton(
              onPressed: () {
                audioProvider.playNext();
              },
              icon: Icon(Icons.skip_next, color: Colors.white, size: 29),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongItem({required String imageUrl, required String title, required String subtitle}) {
    return Container(
      height: 70, // Increased height for better spacing
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          const Icon(
            color: Colors.blue,
            Icons.favorite,
          ),
        ],
      ),
    );
  }
}

class Song {
  final String title;
  final String artist;
  final String imageUrl;
  final String audioUrl;

  Song({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.audioUrl,
  });
}

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Song? _currentSong;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  List<Song> _songs = [];

  AudioProvider() {
    _audioPlayer.positionStream.listen((position) {
      _position = position;
      notifyListeners();
    });

    _audioPlayer.durationStream.listen((duration) {
      _duration = duration ?? Duration.zero;
      notifyListeners();
    });
  }

  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;

  void setPlaylist(List<Song> songs) {
    _songs = songs;
  }

  Future<void> playSong(Song song) async {
    _currentSong = song;
    try {
      await _audioPlayer.setUrl(song.audioUrl);
      _audioPlayer.play();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      // Handle error
      print("Error playing song: $e");
    }
  }

  void pauseSong() {
    _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resumeSong() {
    _audioPlayer.play();
    _isPlaying = true;
    notifyListeners();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void playNext() {
    if (_currentSong != null) {
      int currentIndex = _songs.indexOf(_currentSong!);
      int nextIndex = (currentIndex + 1) ;
      playSong(_songs[nextIndex]);
    }
  }

  void playPrevious() {
    if (_currentSong != null) {
      int currentIndex = _songs.indexOf(_currentSong!);
      int previousIndex = (currentIndex - 1 );
      playSong(_songs[previousIndex]);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

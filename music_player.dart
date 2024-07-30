

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class MusicsPlayer extends StatefulWidget {
  const MusicsPlayer({super.key});

  @override
  State<MusicsPlayer> createState() => _MusicsPlayerState();
}

class _MusicsPlayerState extends State<MusicsPlayer> {
  final List<Song> songs = [
    Song(
      title: 'Dakiti',
      artist: 'Bad Bunny',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlCBS7lZmB_55EgjpMnwKrYwzlqX9V0HcQfg&s',
      audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
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
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 8, 36),
      body: Column(
        mainAxisSize: MainAxisSize.min, // Ensure Column takes minimum space
        children: [
          Container(
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://www.psychologs.com/wp-content/uploads/2023/12/The-Psychology-behind-your-spotify-wrapped-551x431.jpg'),
                fit: BoxFit.cover, // Ensure the image covers the entire container
              ),
            ),
            width: double.infinity,
            child: Stack(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 225.0,left: 14),
                    child: Text(audioProvider._currentSong!.title??'',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                  ),
                  subtitle:
                  Padding(padding: EdgeInsets.only(left: 15),
                  child:Text(audioProvider.currentSong?.artist ?? '',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),
                )
    )
              ],
            ),
          ),
          Container(
            height: 470,
         color:   const Color.fromARGB(255, 2, 8, 36),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0,left: 17),
                  child: Text('Playlist',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(

                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                        itemCount: songs.length,
                        itemBuilder: (context,index){
                          final song = songs[index];
                          return  _buildSongItem(
                              imageUrl: song.imageUrl,
                              title: song.title,
                              subtitle: song.artist,
                            );

                        })),

              ],
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
class Song{
 late final String title;
 late final String artist;
 late final String imageUrl;
 late final String audioUrl;
 Song({
   required this.title,
   required this.artist,
   required this.imageUrl,
   required this.audioUrl,

});

}
class AudioProvider extends ChangeNotifier{
  final AudioPlayer _audioPlayer = AudioProvider() as AudioPlayer;
  Song? _currentSong;
  bool _isPlaying = false;
  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;

  Future<void> playingSong(Song song)async{
    _currentSong = song;
    try{
      await _audioPlayer.setUrl(song.audioUrl);
      _audioPlayer.play();
      _isPlaying = true;
      notifyListeners();
    }
    catch(e){
      print('Error Playing Song: $e');
    }
  }
  void pauseSong(){
    _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }
  void resumeSong(){
    _audioPlayer.pause();
    _isPlaying = true;
    notifyListeners();
  }
  void dispose(){
    _audioPlayer.dispose();
    super.dispose();
  }
}
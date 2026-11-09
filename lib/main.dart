import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MelodyVerseApp());
}

class MelodyVerseApp extends StatelessWidget {
  const MelodyVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MelodyVerse - Multilingual Music Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1DB954),
          brightness: Brightness.dark,
        ),
      ),
      home: const PlaylistHomeScreen(),
    );
  }
}

class PlaylistHomeScreen extends StatelessWidget {
  const PlaylistHomeScreen({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  final String mainPlaylistUrl =
      'https://open.spotify.com/playlist/6UzK2D1usGFK4gAAsbLzP6?si=096fa23a463343b6';

  final List> categories = const [
    {
      'title': 'Primary Spotify Playlist',
      'language': 'Featured',
      'type': 'Playlist',
      'url': 'https://open.spotify.com/playlist/6UzK2D1usGFK4gAAsbLzP6',
      'desc': 'Your custom submitted examination playlist.'
    },
    {
      'title': 'Kesariya - Brahmastra',
      'language': 'Hindi',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/6wf7Yu7VMFv2oF1xU1ZC2g',
      'desc': 'Arijit Singh • Bollywood Chartbuster'
    },
    {
      'title': 'Tum Hi Ho',
      'language': 'Hindi',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/561jH0hW1L8i9ODxL8mlld',
      'desc': 'Arijit Singh • Romantic Hit'
    },
    {
      'title': 'Blinding Lights',
      'language': 'English',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/0VjIjW4GlUZAMYd2vXMi3b',
      'desc': 'The Weeknd • Global Pop Anthem'
    },
    {
      'title': 'Shape of You',
      'language': 'English',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/7qiZf249yMFslvhPStEBsW',
      'desc': 'Ed Sheeran • Pop Hit'
    },
    {
      'title': 'Ramuloo Ramulaa',
      'language': 'Telugu',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/63O49cR4j4UsmkFqD1eWvP',
      'desc': 'Anurag Kulkarni, Mangli • Tollywood Party Track'
    },
    {
      'title': 'Inkem Inkem Kaavale',
      'language': 'Telugu',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/0kW41bSmS8Vb6qYtlyiS8y',
      'desc': 'Sid Sriram • Melodic Hit'
    },
    {
      'title': 'Naa Ready - Leo',
      'language': 'Tamil',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/2gS8U4B48V3h3H9Y7S3XvY',
      'desc': 'Thalapathy Vijay, Anirudh • Kollywood Mass Anthem'
    },
    {
      'title': 'Arabic Kuthu',
      'language': 'Tamil',
      'type': 'Song',
      'url': 'https://open.spotify.com/track/3z30s1mXN0yL9P70lq3yU6',
      'desc': 'Anirudh Ravichander • Viral Hit'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎵 MelodyVerse - Multilingual Music Hub'),
        backgroundColor: const Color(0xFF1DB954),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1DB954), Color(0xFF121212)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Flutter Web Lab Examination Project',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Curated Music Playlist & Multi-Language Tracks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    icon: const Icon(Icons.play_arrow, color: Color(0xFF1DB954)),
                    label: const Text('Open Main Spotify Playlist', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () => _launchURL(mainPlaylistUrl),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Explore Tracks by Language (Hindi, English, Telugu, Tamil)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                childAspectRatio: 2.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];
                return InkWell(
                  onTap: () => _launchURL(item['url']!),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF181818),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1DB954).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.music_note, color: Color(0xFF1DB954)),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${item['language']} • ${item['type']}',
                                style: const TextStyle(color: Color(0xFF1DB954), fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.open_in_new, color: Colors.white54, size: 18),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

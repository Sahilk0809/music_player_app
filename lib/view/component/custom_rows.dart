import 'package:flutter/material.dart';
import 'package:music_player_app/provider/music_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../music_screen.dart';

class CustomRows extends StatelessWidget {
  final String text;

  const CustomRows({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<MusicProvider>(context);
    final providerFalse = Provider.of<MusicProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: green,
            letterSpacing: 1.5,
            
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        // displaying the songs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              providerTrue.musicModal!.data.result.length,
              (index) => GestureDetector(
                onTap: () async {
                  // passing current index to selectedIndex
                  providerTrue.selectedIndex = index;

                  // setting the path of the music to the audioPlayer which user selected
                  await providerTrue.audioPlayer.setUrl(providerTrue
                      .musicModal!.data.result[index].downloadUrl.first.url);
                  // Provider.of<MusicProvider>(context).audioPlayer.play();
                  // Provider.of<MusicProvider>(context, listen: false).togglePlay();
                  providerFalse.togglePlay();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MusicScreen(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: height * 0.2,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.1),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            providerTrue
                                .musicModal!.data.result[index].image[2].url,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.3,
                      child: Text(
                        providerTrue.musicModal!.data.result[index].name,
                        style: const TextStyle(
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

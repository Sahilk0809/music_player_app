import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [black1, black2],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://blackholeapp.net/wp-content/uploads/2024/04/blackhole-apk.webp?ezimgfmt=ng%3Awebp%2Fngcb1%2Frs%3Adevice%2Frscb1-2'), // Add your logo here
            ),
            SizedBox(height: height * 0.02),
            const Text(
              'BlackHole',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'v1.15.7',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'This is an open-source project and can be found on',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'GitHub',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              child: const Text('Buy me coffee'),
            ),
            const SizedBox(height: 10),
            const Text(
              'OR',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              child: const Text('Donate with GPay'),
            ),
            SizedBox(height: height * 0.05),
            const Text(
              'Sponsor this project',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            const Text(
              'Made with ❤️ by Ankit Sangwan',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Column songsColumn(
//   BuildContext context,
//   double height,
//   double width,
//   String text,
//   MusicProvider providerTrue,
//   MusicProvider providerFalse,
// ) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         text,
//         style: TextStyle(
//           color: green,
//           letterSpacing: 1.5,
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//
//       // displaying the songs
//       SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: List.generate(
//             providerTrue.musicModal!.data.result.length,
//                 (index) => GestureDetector(
//               onTap: () async {
//                 // passing current index to selectedIndex
//                 providerTrue.selectedIndex = index;
//
//                 // setting the path of the music to the audioPlayer which user selected
//                 await providerTrue.audioPlayer.setUrl(providerTrue
//                     .musicModal!.data.result[index].downloadUrl.first.url);
//                 // Provider.of<MusicProvider>(context).audioPlayer.play();
//                 // Provider.of<MusicProvider>(context, listen: false).togglePlay();
//                 providerFalse.togglePlay();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const MusicScreen(),
//                   ),
//                 );
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     margin: const EdgeInsets.only(top: 10, right: 10),
//                     height: height * 0.2,
//                     width: width * 0.4,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white.withOpacity(0.1),
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                           providerTrue
//                               .musicModal!.data.result[index].image[2].url,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.01,
//                   ),
//                   SizedBox(
//                     width: width * 0.3,
//                     child: Text(
//                       providerTrue.musicModal!.data.result[index].name,
//                       style: const TextStyle(
//                         fontSize: 17,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }
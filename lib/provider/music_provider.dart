import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_app/modal/music_modal.dart';
import 'package:music_player_app/utils/list.dart';

class MusicProvider extends ChangeNotifier {
  List<MusicModal> audioList = []; // list musics
  int selectedIndex = 0; // index selected by he user

  final audioPlayer = AudioPlayer(); // instance of audio player
  bool isPlay = false; // is music is playing or not

  Duration? position; // current position of the music
  Duration? duration; // duration of the music
  double speed = 1.0; // speed of the music

  List<MusicModal> favouriteList = []; // favourite music list

  // current position of the current music
  Duration? positionOfTheSlider() {
    audioPlayer.positionStream.listen(
      (event) {
        position = event;
        notifyListeners();
      },
    );
    return position;
  }

  // current music's duration
  Duration? durationOfTheTimer() {
    audioPlayer.durationStream.listen(
      (event) {
        duration = event;
        notifyListeners();
      },
    );
    return duration;
  }

  // changing the position to seconds
  void changeToSeconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
    notifyListeners();
  }

  // toggling the speed of the music
  void toggleSpeed(double value) {
    speed = value;
    audioPlayer.setSpeed(speed);
    notifyListeners();
  }

  // forwarding song
  void forwardSong() {
    selectedIndex = selectedIndex + 1;
    audioPlayer.setAsset(audioList[selectedIndex].audio);
    notifyListeners();
  }

  // reversing the song
  void backSong() {
    selectedIndex = selectedIndex - 1;
    audioPlayer.setAsset(audioList[selectedIndex].audio);
    notifyListeners();
  }

  // toggling the between play and pause
  void togglePlay() {
    isPlay = !isPlay;
    if (isPlay) {
      audioPlayer.play();
    } else {
      audioPlayer.pause();
    }
    notifyListeners();
  }

  // the list of map to list of object
  void listOfObject(List l1) {
    for (int i = 0; i < l1.length; i++) {
      audioList.add(MusicModal.fromMap(l1[i]));
    }
  }

  void addingFavouriteSongs(){
    favouriteList.add(audioList[selectedIndex]);
    notifyListeners();
  }

  MusicProvider() {
    listOfObject(musicList);
  }
}

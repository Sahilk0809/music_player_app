class MusicModal {
  late String name, artist, image, audio;

  MusicModal({
    required this.name,
    required this.image,
    required this.audio,
    required this.artist,
  });

  factory MusicModal.fromMap(Map m1) {
    return MusicModal(
      name: m1['name'],
      image: m1['image'],
      audio: m1['audio'],
      artist: m1['artist'],
    );
  }
}

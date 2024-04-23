import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:latihan_audio_player/provider/audio_provider.dart';
import 'package:latihan_audio_player/utils/utils.dart';
import 'package:latihan_audio_player/widget/audio_controller_widget.dart';
import 'package:provider/provider.dart';
import '../widget/buffer_slider_controller_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AudioPlayer audioPlayer;
  late final Source audiaSource;

  @override
  void initState() {
    final provider = context.read<AudioNotifier>();
    audioPlayer = AudioPlayer();
    audiaSource = AssetSource("flutter_intermediate_academy_cricket.wav");
    // audiaSource = UrlSource(
    //     "https://github.com/dicodingacademy/assets/raw/main/flutter_intermediate_academy/bensound_ukulele.mp3");

    audioPlayer.setSource(audiaSource);

    audioPlayer.onPlayerStateChanged.listen((event) {
      provider.isPlay = event == PlayerState.playing;
      if (event == PlayerState.stopped) {
        provider.position = Duration.zero;
      }
    });

    audioPlayer.onDurationChanged.listen((event) {
      provider.duration = event;
    });

    audioPlayer.onPositionChanged.listen((event) {
      provider.position = event;
    });

    audioPlayer.onPlayerComplete.listen((event) {
      provider.position = Duration.zero;
      provider.isPlay = false;
    });

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player Project"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<AudioNotifier>(builder: (
            context,
            provider,
            child,
          ) {
            final duration = provider.duration;
            final position = provider.position;
            return BufferSliderControllerWidget(
              maxValue: duration.inSeconds.toDouble(),
              currentValue: position.inSeconds.toDouble(),
              minText: durationToTimeString(position),
              maxText: durationToTimeString(duration),
              onChanged: (value) async {
                final newPosition = Duration(seconds: value.toInt());
                await audioPlayer.seek(newPosition);

                await audioPlayer.resume();
              },
            );
          }),
          Consumer<AudioNotifier>(builder: (
            context,
            provider,
            child,
          ) {
            final bool isPlay = provider.isPlay;
            return AudioControllerWidget(
              onPlayTapped: () {
                audioPlayer.play(audiaSource);
              },
              onPauseTapped: () {
                audioPlayer.pause();
              },
              onStopTapped: () {
                audioPlayer.stop();
              },
              isPlay: isPlay,
            );
          }),
        ],
      ),
    );
  }
}

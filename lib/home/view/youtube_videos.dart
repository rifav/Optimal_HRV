import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class _usingApp extends StatelessWidget {
  static String videoID = 'hDhZKWHyfWk';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

@override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Using the App'),
      ),
      body: Container(
        child: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
          showVideoProgressIndicator: true,
        ),
      ));
  }
}

class _breathing extends StatelessWidget {
  static String videoID = 'hepEYb5x0hU';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Low and Slow Breathing'),
        ),
        body: Container(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
        ));
  }
}

class whatIsHRV extends StatelessWidget {
  static String videoID = 'zOkz0YyWd-Y';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('What is HRV?'),
        ),
        body: Container(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
        ));
  }
}

class _hrvImportance extends StatelessWidget {
  static String videoID = '0pfxIFid4h4';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Why is HRV Important?'),
        ),
        body: Container(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
        ));
  }
}

class _rFreq extends StatelessWidget {
  static String videoID = 'GHl9rnqAkSg';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Resonance Frequency'),
        ),
        body: Container(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
        ));
  }
}

class _improveST extends StatelessWidget {
  static String videoID = 'p5uF8bj9qhU';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Improving Short Term HRV'),
        ),
        body: Container(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
        ));
  }
}

class _improveLT extends StatelessWidget {
  static String videoID = 'yvllmOAaHOw';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Improving Long Term HRV'),
        ),
        body: Container(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
        ));
  }
}

class YouTubePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('YouTube Videos'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child: InkWell(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('Learn about optimalHRV', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Align(
                          child: Icon(Icons.arrow_forward, color: Color(0xFFEF5350),
                          )
                        )
                        ],
                      ),
                      onTap: () async {
                    await launch('https://www.optimalhrv.com/', forceWebView: false);
                    }
                    )
                  ),
                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child: InkWell(
                      onTap: (){
                        //Navigator.pop(context, true);
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => _usingApp()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network('https://img.youtube.com/vi/hDhZKWHyfWk/0.jpg'),
                          Text('1. Using the App', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ),

                  const SizedBox(height: 12),

                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child: InkWell(
                      onTap: () {
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => _breathing()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network('https://img.youtube.com/vi/hepEYb5x0hU/0.jpg'),
                          Text('2. Low and Slow \nBreathing', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child:InkWell(
                      onTap: () {
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => whatIsHRV()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network('https://img.youtube.com/vi/zOkz0YyWd-Y/0.jpg'),
                          Text('3. What is HRV?', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child: InkWell(
                      onTap: (){
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => _hrvImportance()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network('https://img.youtube.com/vi/0pfxIFid4h4/0.jpg'),
                          Text('4. Why is HRV \nImportant?', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child: InkWell(
                      onTap: () {
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => _improveST()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network('https://img.youtube.com/vi/p5uF8bj9qhU/0.jpg'),
                          Text('5. Improving Short \nTerm HRV', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child:InkWell(
                      onTap: () {
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => _rFreq()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network('https://img.youtube.com/vi/GHl9rnqAkSg/0.jpg'),
                          Text('6. Resonance \nFrequency', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                    child: InkWell(
                      onTap: () {
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => _improveLT()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network('https://img.youtube.com/vi/yvllmOAaHOw/0.jpg'),
                          Text('7. Improving Long \nTerm HRV', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          )
      ),
    );
  }
}

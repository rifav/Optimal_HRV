import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';


dynamic _launchURLInBrowser() async {
  const url = 'https://medium.com/@malkhansingh95699';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
dynamic _launchURLInApp() async {
  const url = 'https://www.optimalhrv.com/';
  if (await canLaunch(url)){
  await launch(
  url,
  forceWebView: false,
  );
  } else {
  throw 'Could not launch $url';
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('1. Using the App', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('2. Low and Slow Breathing', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('3. What is HRV?', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('4. Why is HRV Important?', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('5. Improving Short Term HRV', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('6. Resonance Frequency', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  Ink(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 125, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('7. Improving Long Term HRV', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
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

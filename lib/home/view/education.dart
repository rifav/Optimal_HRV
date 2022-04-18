// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationPage extends StatelessWidget {
  final _contentStyle = const TextStyle(
      color: Colors.black, fontSize: 12.5, fontWeight: FontWeight.bold);

  final _youTubeStyle = const TextStyle(
      color: Colors.red, fontSize: 15);

  final _spotifyStyle = const TextStyle(
      color: Colors.green, fontSize: 15);

  var book1 = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Biofeedback and Mindfulness in Everyday Life', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\n\nBy Inna Khazan', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var book2 = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'The Clinical Handbook of Biofeedback', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\n\nBy Inna Khazan', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var book3 = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Heart Rate Variability', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\n\nMatthew S Bennett', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var book4 = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Talking about Trauma and Change', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\n\nMatthew S Bennett', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var book5 = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Connecting Paradigms', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\n\nMatthew S Bennett', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var book6 = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Trauma-Sensitive Early Education', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\n\nMatthew S Bennett & Sarah Bennett', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Podcast & Books'),
          backgroundColor: theme.primaryColor,
          automaticallyImplyLeading: true,
          bottom: const TabBar(
            indicatorColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Podcasts',
              ),
              Tab(text: 'Readings'),
            ],
          ),
        ),
        body: TabBarView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Align(
                      //alignment: FractionalOffset(0.5, 0.01),
                        alignment: Alignment.topCenter,
                        child: Text('Welcome to the Heart Rate Variability Podcast where we discuss the '
                            'the research and applications of heart rate variability.', style: _contentStyle,)
                    ),
                    SizedBox(height: 50),
                    ListTile(
                      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(5)),
                      //leading: Icon(Icons.add),
                      title: Text('Listen and Watch on YouTube',textScaleFactor: 1.0, style: _youTubeStyle),
                      trailing: Icon(Icons.arrow_forward, color: Colors.red,),
                      subtitle: Text('Listen to our podcast now'),
                      selected: false,
                      onTap: () async {
                        const url = 'https://m.youtube.com/playlist?list=PL3ZZFn-22uRkxHc7ceuAl1FNYH7oDRSM2';
                        if (await canLaunch(url)){
                          await launch(
                            url,
                            forceWebView: false,
                          );
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                    ),
                    SizedBox(height: 10),
                    ListTile(
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                      //leading: Icon(Icons.add),
                        title: Text('Listen on Spotify ',textScaleFactor: 1.0, style: _spotifyStyle),
                        trailing: Icon(Icons.arrow_forward, color: Colors.green),
                        subtitle: Text('Listen to our podcast now'),
                        selected: false,
                        onTap: () async {
                          const url = 'https://open.spotify.com/show/58qvAMBmC4A4fMsd9Wgvna';
                          if (await canLaunch(url)){
                            await launch(
                              url,
                              forceWebView: false,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        }
                    ),
                  ],
                )
              ),

              Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Align(
                        //alignment: FractionalOffset(0.5, 0.01),
                          alignment: Alignment.topCenter,
                          child: Text('Interested in learning more about Heart Rate Variability? Check out the readings below.', style: _contentStyle,)
                      ),
                      SizedBox(height: 20),
                      ListTile(
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                          //leading: Icon(Icons.add),
                          title: book1,
                          trailing: Icon(Icons.arrow_forward, color: Colors.green,),
                          subtitle: Text('Published: 2019'),
                          selected: false,
                          onTap: () {
                            Navigator.of(
                              context).push<void>(MaterialPageRoute(builder: (context) => book1_page()),
                            );
                          },
                      ),
                      SizedBox(height: 10),
                      ListTile(
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                          //leading: Icon(Icons.add),
                          title: book2,
                          trailing: Icon(Icons.arrow_forward, color: Colors.green),
                          subtitle: Text('Published: 2013'),
                          selected: false,
                          onTap: () {
                            Navigator.of(
                                context).push<void>(MaterialPageRoute(builder: (context) => book2_page()),
                            );
                          },
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        //leading: Icon(Icons.add),
                        title: book3,
                        trailing: Icon(Icons.arrow_forward, color: Colors.green),
                        subtitle: Text('Published: 2020'),
                        selected: false,
                        onTap: () {
                          Navigator.of(
                              context).push<void>(MaterialPageRoute(builder: (context) => book3_page()),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        //leading: Icon(Icons.add),
                        title: book4,
                        trailing: Icon(Icons.arrow_forward, color: Colors.green),
                        subtitle: Text('Published: 2018'),
                        selected: false,
                        onTap: () {
                          Navigator.of(
                              context).push<void>(MaterialPageRoute(builder: (context) => book4_page()),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        //leading: Icon(Icons.add),
                        title: book5,
                        trailing: Icon(Icons.arrow_forward, color: Colors.green),
                        subtitle: Text('Published: 2017'),
                        selected: false,
                        onTap: () {
                          Navigator.of(
                              context).push<void>(MaterialPageRoute(builder: (context) => book5_page()),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        //leading: Icon(Icons.add),
                        title: book6,
                        trailing: Icon(Icons.arrow_forward, color: Colors.green),
                        subtitle: Text('Published: 2018'),
                        selected: false,
                        onTap: () {
                          Navigator.of(
                              context).push<void>(MaterialPageRoute(builder: (context) => book6_page()),
                          );
                        },
                      ),
                    ],
                  )
              ),
        ]
        ),
      ));
}


class book1_page extends StatelessWidget {
  var header = Container(
      child: Text(
        "Biofeedback and Mindfulness in Everyday Life"
            "\n\nBy: Inna Khazan ",
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5, color: Color(0xFF6F8398), fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.all(16)
  );

  var description =
  Container(
      child: Text(
    "Book Description: \n\nA mind-body approach to taking control of your physical and emotional health. ",
    textAlign: TextAlign.justify,
    style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
  ),
      padding: EdgeInsets.all(16)
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISBN: 9780393712933"),
      ),
      body: SafeArea(
    child: Column(
    children: <Widget>[
      header,
      Divider(
        height: 40,
        thickness: 5,
      ),
      description
    ],
    ),
      ),
    );
  }
}

class book2_page extends StatelessWidget {
  var header = Container(
      child: Text(
        "The Clinical Handbook of Biofeedback"
            "\n\nBy: Inna Khazan ",
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5, color: Color(0xFF6F8398), fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.all(16)
  );

  var description =
  Container(
      child: Text(
        "Book Description: \n\n A practical guide to the clinical use of biofeedback,"
        "integrating powerful mindfulness techniques. Adefinitive desk reference for the use of peripheral "
        "biofeedback techniques in psychotherapeutic settings, backed by a wealth of clinical research Introduces "
        "mindfulness and acceptance techniques and shows how these methods can be incorporated into "
        "biofeedback practice Step-by-step instructions provide everything a clinician needs to integrate biofeedback "
        "and mindfulness including protocols, exemplar logs for tracking symptoms, and sample scripts for mindfulness "
        "exercises Includes scientifically robust treatment protocols for a range of common problems including "
        "headaches, hypertension and chronic pain"
        ,
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
      ),
      padding: EdgeInsets.all(16)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISBN: 9781118485323"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            header,
            Divider(
              height: 40,
              thickness: 5,
            ),
            description
          ],
        ),
      ),
    );
  }
}

class book3_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISBN: 9798670848411"),
      ),
      body: Container(
        child: Text("Matthew S Bennett"),
      ),
    );
  }
}

class book4_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISBN: 9781976844515"),
      ),
      body: Container(
        child: Text("Matthew S Bennett"),
      ),
    );
  }
}

class book5_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISBN: 9781521800850"),
      ),
      body: Container(
        child: Text("Matthew S Bennett"),
      ),
    );
  }
}

class book6_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISBN: 9781695681033"),
      ),
      body: Container(
        child: Text("Matthew S Bennett & Sarah Bennett"),
      ),
    );
  }
}
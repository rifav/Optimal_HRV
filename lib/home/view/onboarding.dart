import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class ManualSlide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OnboardingPage();
  }
}

class OnboardingPage extends State<ManualSlide> {
  CarouselController carouselController = new CarouselController();
  bool isChecked = false;

   Map<String, bool?> values = {
    'Watch using the Optimal HRV App video': false,
    'Schedule reminders for morning reading': false,
    'Take your first morning reading': false,
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Onboarding Tasks'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Column( // ListView
        children: [
          CarouselSlider(
            items: [
              //1st page of Slider
/*              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                    Text('Day 1', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                    Expanded(child:
                    ListView(
                      children: values.keys.map((String key) {
                       return CheckboxListTile(
                          title: new Text(key),
                          value: values[key],
                          onChanged: (bool? value) {
                            setState(() {
                              values[key] = value;
                            });
                          },
                        );
                      }).toList(),
                    )
                    )
                  ]
              ), */

/*              SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Text('Day 1', style: TextStyle(fontSize: 20)),
                  ),

                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Column(//ListView(
                    //shrinkWrap: true,
                    children: values.keys.map((String key) {
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(key),
                        value: values[key],
                        onChanged: (bool? value) {
                          setState(() {
                            values[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
              ),*/
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Text('Day 1', style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),

                    Column(
                      children: values.keys.map((String key) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: theme.primaryColor,
                          title: Text(key),
                          value: values[key],
                          onChanged: (bool? value) {
                            setState(() {
                              values[key] = value;
                            });
                          },
                        );

                      }).toList(),
                    )

                    ],

                ),
              ),
              ),



              //2nd page of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                child: const Text('Day 2',
                    style: TextStyle(fontSize: 20)),
              ),

              //3rd page of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                child: const Text('Day 3',
                    style: TextStyle(fontSize: 20)),
              ),

              //4th page of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                child: const Text('Day 4',
                    style: TextStyle(fontSize: 20)),
              ),

              //5th page of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                child: const Text('Day 5',
                    style: TextStyle(fontSize: 20)),
              ),

              //6th page of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                child: const Text('Day 6',
                    style: TextStyle(fontSize: 20)),
              ),

              //7th page of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                child: const Text('Day 7',
                    style: TextStyle(fontSize: 20)),
              ),

            ],
            carouselController: carouselController,
            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              //enlargeCenterPage: true,
              //autoPlay: true,
              aspectRatio: 16 / 9,
              //autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              //autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),

            Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: theme.primaryColor, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: Text("Previous"),
                    onPressed: () {
                      carouselController.previousPage();
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: theme.primaryColor, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: Text("Next"),
                    onPressed: () {
                      carouselController.nextPage();
                    },
                  )
                ],

              ),
            ),
          ),
        ],
      ),

    );
  }
}
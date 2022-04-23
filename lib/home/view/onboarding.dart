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

  bool firstvalue = false;
  bool secondvalue = false;

  final headerStyle =  TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.bold,
      fontSize: 20);

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
              // first page of slider
              Container(
                height: 400,
                //margin: EdgeInsets.all(6.0),
                child: Center(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.blueGrey.shade100,
                          child:  Center(child: Text('Day 1', style: headerStyle)),
                        ),
                        CheckboxListTile(
                          value: this.firstvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.firstvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Watch using the Optimal HRV App Video'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Schedule reminders for morning reading'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Take our first morning reading'),
                        ),

                      ]
                  ),
                ),//
              ),

              //2nd page of Slider
              Container(
                height: 400,
                //margin: EdgeInsets.all(6.0),
                child: Center(
                child: ListView(
                    children: <Widget>[
                      Container(
                        height: 50,
                        color: Colors.blueGrey.shade100,
                        child: Center(child: Text('Day 2', style: headerStyle)),
                      ),
                      CheckboxListTile(
                          value: this.firstvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.firstvalue = value!;
                            }
                            );
                          },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Take a morning reading'),
                      ),

                      CheckboxListTile(
                        value: this.secondvalue,
                        onChanged: (bool? value){
                          setState(() {
                            this.secondvalue = value!;
                          }
                          );
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Watch Low and Slow breathing video'),
                      ),

                      CheckboxListTile(
                        value: this.secondvalue,
                        onChanged: (bool? value){
                          setState(() {
                            this.secondvalue = value!;
                          }
                          );
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Practice a 2-minute low and slow breathing '
                            'exercise, no pacer'),
                      ),

                    ]
                ),
                ),//
              ),

              //3rd page of Slider
              Container(
                height: 400,
                //margin: EdgeInsets.all(6.0),
                child: Center(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.blueGrey.shade100,
                          child: Center(child: Text('Day 3', style: headerStyle)),
                        ),
                        CheckboxListTile(
                          value: this.firstvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.firstvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Take morning reading'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Watch video -  What is HRV?'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Practice a 4-minute low and slow breathing '
                              'exercise, no pacer'),
                        ),

                      ]
                  ),
                ),//
              ),

              //4th page of Slider
              Container(
                height: 400,
                //margin: EdgeInsets.all(6.0),
                child: Center(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.blueGrey.shade100,
                          child: Center(child: Text('Day 4', style: headerStyle)),
                        ),
                        CheckboxListTile(
                          value: this.firstvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.firstvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Take morning reading'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Watch video -  Why is HRV Important?'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Practice a 6-minute low and slow breathing '
                              'exercise, using pacer at 6 breaths per minute'),
                        ),

                      ]
                  ),
                ),//
              ),

              //5th page of Slider
              Container(
                height: 400,
                //margin: EdgeInsets.all(6.0),
                child: Center(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.blueGrey.shade100,
                          child: Center(child: Text('Day 5', style: headerStyle)),
                        ),
                        CheckboxListTile(
                          value: this.firstvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.firstvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Take morning reading'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Watch video -  How do I Improve Short-term HRV?'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Practice an 8-minute low and slow breathing '
                              'exercise, using pacer at 6 breaths per minute'),
                        ),

                      ]
                  ),
                ),//
              ),

              //6th page of Slider
              Container(
                height: 400,
                //margin: EdgeInsets.all(6.0),
                child: Center(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.blueGrey.shade100,
                          child: Center(child: Text('Day 6', style: headerStyle)),
                        ),
                        CheckboxListTile(
                          value: this.firstvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.firstvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Take morning reading'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Watch Resonance Breathing video'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Complete Resonance Frequency Training'),
                        ),

                      ]
                  ),
                ),//
              ),

              //7th page of Slider
              Container(
                height: 400,
                //margin: EdgeInsets.all(6.0),
                child: Center(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.blueGrey.shade100,
                          child: Center(child: Text('Day 7', style: headerStyle)),
                        ),
                        CheckboxListTile(
                          value: this.firstvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.firstvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Take morning reading'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Watch video -  How do I Improve Long-term HRV?'),
                        ),

                        CheckboxListTile(
                          value: this.secondvalue,
                          onChanged: (bool? value){
                            setState(() {
                              this.secondvalue = value!;
                            }
                            );
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Practice 10-minute of HRV breathing'
                              'at Resonance Frequency'),
                        ),

                      ]
                  ),
                ),//
              ),

            ],
            carouselController: carouselController,
            //Slider Container properties
            options: CarouselOptions(
              height: 250.0,
              //enlargeCenterPage: true,
              //autoPlay: true,
              aspectRatio: 16 / 9,
              //autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              //autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1.0,
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
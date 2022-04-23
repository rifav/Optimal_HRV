import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:accordion/accordion.dart';

class Reminders extends StatelessWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Alert')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push<void>(
              context,
              MaterialPageRoute(
                  builder: (context) => DateTimePicker()));//popUpReminder()));
          //DateTimePicker()));//
        },
        label: const Text('New Reminder',
            style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: theme.primaryColor,
        heroTag: "remindMe",
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.startFloat,

      body: Align(
        alignment: Alignment.topCenter,
        child:
          Text('Reminders List',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300 ))
      ),
    );
  }
}

class popUpReminder extends StatelessWidget
{
  const popUpReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Reminder'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //buildCard(),
                  //buildCard(),
                  DateTimePicker()
                ],
              )),
        )
    );
  }
}

Card buildCard() {
    var heading = 'Today\'s Reminder';
    var subheading = '2 bed, 1 bath, 1300 sqft';
    var cardImage = NetworkImage(
        'https://source.unsplash.com/random/800x600?house');
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';
    String value = "";
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              //subtitle: Text(subheading),
              trailing: Icon(Icons.favorite_outline),
            ),
            Container(
                width: 300,
                child: TextField(
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                )

            ),
            Container(
                width: 300,
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: "Notes",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                )
            ),
            Container(
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Details',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ), // here
                onPressed: () {

                },

                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10
              ),
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    /* ... */
                  },
                )
              ],
            )
          ],
        ));
  }


class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  String value = "";

  late double _height;
  late double _width;

  late String _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Reminder'),
      ),
      body: Container( // Container
        width: _width,
        height: _height,
        child: SingleChildScrollView( // Column
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
                //width: 300,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                        border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                )
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Notes',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                )
            ),

            // accordion for choosing date
            Accordion(
                headerBackgroundColor: Color(0xFFEEEEEE),
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              maxOpenSections: 1,
              children: [
                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.calendar_today, color: Colors.redAccent),
                  header: Text('Date'),
                  content: Column(
                    children: <Widget>[
                      Text(
                        'Choose Date',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          width: _width / 1.7,
                          height: _height / 9,
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: TextFormField(
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                            enabled: false,
                            keyboardType: TextInputType.text,
                            controller: _dateController,
                            onSaved: (String? val) {
                              _setDate = val!;
                            },
                            decoration: InputDecoration(
                                disabledBorder:
                                UnderlineInputBorder(borderSide: BorderSide.none),
                                // labelText: 'Time',
                                contentPadding: EdgeInsets.only(top: 0.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  contentHorizontalPadding: 40,
                  contentBorderWidth: 1,
                ),

                AccordionSection(
                  isOpen: false,
                  leftIcon: Icon(Icons.schedule, color: Colors.blueAccent),
                  header: Text('Time'),
                  content: Column(
                    children: <Widget>[
                      Text(
                        'Choose Time',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      InkWell(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: _width / 1.7,
                          height: _height / 9,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: TextFormField(
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                            onSaved: (String? val) {
                              _setTime = val!;
                            },
                            enabled: false,
                            keyboardType: TextInputType.text,
                            controller: _timeController,
                            decoration: InputDecoration(
                                disabledBorder:
                                UnderlineInputBorder(borderSide: BorderSide.none),
                                // labelText: 'Time',
                                contentPadding: EdgeInsets.all(5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                )
              ],
            ),


            Column(
              children: <Widget>[
                Text(
                  'Details',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: _width / 1.7,
                    height: _height / 9,
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController,
                      onSaved: (String? val) {
                        _setDate = val!;
                      },
                      decoration: InputDecoration(
                          disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                /*
                Text(
                  'Choose Time',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                */
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: _width / 1.7,
                    height: _height / 9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      onSaved: (String? val) {
                        _setTime = val!;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),

            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10
              ),
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    /* ... */
                  },
                )
              ],
            )
          ],
        ),
        ),// here
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
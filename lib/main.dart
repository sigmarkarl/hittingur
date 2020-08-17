import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Ég <- Hittingur -> Kröfur'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool checkedValue = false;
  KrofurState krofur = KrofurState();
  Gender gender = Gender.Kona;
  double val = 2000;
  PageController _controller = PageController(
    initialPage: 1,
  );
  int page = 1;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  String getBartitle(int page) {
    if (page == 1)
      return "Ég";
    else if (page == 2)
      return "Tillögur";
    else if (page == 3)
      return "Hittingur";
    else if (page == 4) return "Kröfur";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(getBartitle(page)),
      ),
      body: PageView(
        controller: _controller,
        children: [
          PersonState(this),
          MyPage2Widget(),
          krofur,
          krofur,
        ],
      ),
    );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    /*return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              title: Text("title text"),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("title text"),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/
  }
}

enum Gender { Kona, Karl }

class PersonState extends StatefulWidget {
  _MyHomePageState homePageState;
  PersonState(_MyHomePageState hstate) {
    homePageState = hstate;
  }
  MyPage1Widget createState() => MyPage1Widget(homePageState);
}

class MyPage1Widget extends State<PersonState> {
  //Gender gender = Gender.Kona;
  //double val = 2000;

  _MyHomePageState homePageState;
  MyPage1Widget(_MyHomePageState hstate) {
    homePageState = hstate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: const Text("Kona"),
          value: Gender.Kona,
          groupValue: homePageState.gender,
          onChanged: (newValue) {
            setState(() {
              homePageState.gender = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        RadioListTile(
          title: const Text("Karl"),
          value: Gender.Karl,
          groupValue: homePageState.gender,
          onChanged: (newValue) {
            setState(() {
              homePageState.gender = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(children: <Widget>[
            Text('Fæðingarár:'),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always),
                child: Slider(
                  min: 1925,
                  max: 2002,
                  divisions: 77,
                  value: homePageState.val,
                  label: '${homePageState.val}',
                  onChanged: (double value) {
                    setState(() {
                      homePageState.val = value;
                    });
                  },
                ),
              ),
            ),
            Text('${homePageState.val}'),
          ]),
        ),
        /*lowerValue: _lowerValue,
          upperValue: _upperValue,
          divisions: 50,
          showValueIndicator: true,
          valueIndicatorMaxDecimals: 4,
          onChanged: (double newLowerValue, double newUpperValue) {
            setState(() {
              _lowerValue = newLowerValue;
              _upperValue = newUpperValue;
            });
          },
          onChangeStart: (double startLowerValue, double startUpperValue) {
            print('Started with values: $startLowerValue and $startUpperValue');
          },
          onChangeEnd: (double newLowerValue, double newUpperValue) {
            print('Ended with values: $newLowerValue and $newUpperValue');
          },*/
        /*CheckboxListTile(
          title: Text("Karla"),
          value: f,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),*/
      ],
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkBlue, height: 50),
            MyBox(darkBlue, height: 50),
          ],
        ),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
        MyBox(mediumBlue, text: 'PageView 2'),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
      ],
    );
  }
}

class KrofurState extends StatefulWidget {
  MyPage3Widget createState() {
    debugPrint("hoho");
    return MyPage3Widget();
  }
}

class MyPage3Widget extends State<KrofurState> {
  bool konur = false;
  bool karla = false;
  RangeValues rv = RangeValues(18, 99);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          title: Text("Konur"),
          value: konur,
          onChanged: (newValue) {
            setState(() {
              konur = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        CheckboxListTile(
          title: Text("Karla"),
          value: karla,
          onChanged: (newValue) {
            setState(() {
              karla = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(children: <Widget>[
            Text('Aldursbil:'),
            Text('${rv.start}'),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always),
                child: RangeSlider(
                  min: 18,
                  max: 99,
                  divisions: 81,
                  values: rv,
                  labels: RangeLabels('${rv.start}', '${rv.end}'),
                  onChanged: (RangeValues values) {
                    setState(() {
                      rv = values;
                    });
                  },
                ),
              ),
            ),
            Text('${rv.end}'),
          ]),
        ),
        /*lowerValue: _lowerValue,
          upperValue: _upperValue,
          divisions: 50,
          showValueIndicator: true,
          valueIndicatorMaxDecimals: 4,
          onChanged: (double newLowerValue, double newUpperValue) {
            setState(() {
              _lowerValue = newLowerValue;
              _upperValue = newUpperValue;
            });
          },
          onChangeStart: (double startLowerValue, double startUpperValue) {
            print('Started with values: $startLowerValue and $startUpperValue');
          },
          onChangeEnd: (double newLowerValue, double newUpperValue) {
            print('Ended with values: $newLowerValue and $newUpperValue');
          },*/
        /*CheckboxListTile(
          title: Text("Karla"),
          value: f,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),*/
      ],
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  MyBox(this.color, {this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}

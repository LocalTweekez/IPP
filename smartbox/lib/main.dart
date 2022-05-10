
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:direct_select/direct_select.dart';
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
========
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Matlåda',
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
      ),
      home: const MyHomePage(title: 'Smart Matlåda'), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _temp = 0;
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
  int currentIndex = 0;

  final elements1 = [
    "0°C",
    "1°C",
    "2°C",
========
  int _currentIndex = 0; //IF bluetooth device not connected => -1 
  int _index = 0;
  int stepMax = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  final elements1 = [
    "0°C", "1°C", "2°C", "3°C", "4°C", "5°C", "6°C"
>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
  ];
  int? selectedIndex1 = 0;

  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
          title: val,
        ))
        .toList();
  }
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
  
========

>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
  void _increaseTemp() {
    setState(() {
      _temp++;
    });
  }
  
  void _decreaseTemp() {
    setState(() {
      _temp--;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
        title: Text(widget.title, style: const TextStyle(fontFamily: 'Lobster'),),
========
        title: Text("Smartbox", style: const TextStyle(fontFamily: 'Lobster'),),
>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
        child: currentIndex == 0 ? Column(
========
        child: _currentIndex == 0 ? Column(
>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              radius: 300,
              backgroundColor: Colors.grey.shade300,
              lineWidth: 10,
              progressColor: _temp < 30 ? Colors.blue.shade400 : Colors.red.shade400, 
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
              percent: 0.7,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
========
              percent: 0.6,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: 1200,
>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
              center: Text(
                '$_temp°C',
                 style: Theme.of(context).textTheme.headline4,
              ),
            ),
            DirectSelect(
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
              itemExtent: 35.0,
========
              itemExtent: 50.0,
>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
              selectedIndex: selectedIndex1!,
              child: MySelectionItem(
                isForList: false,
                title: elements1[selectedIndex1!],
              ),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedIndex1 = index;
                });
              },
              mode: DirectSelectMode.tap,
              items: _buildItems1()),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 20.0),
                child: Text(
                  "test",
                  style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  foregroundColor: Colors.red.shade400,
                  backgroundColor: Colors.white,
                  onPressed: _increaseTemp,
                  tooltip: 'Increase',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.blue.shade400,
                  backgroundColor: Colors.white,
                  onPressed: _decreaseTemp,
                  tooltip: 'Decrease',
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ) 
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
      : const Center(child: Text('SETTINGS', style: TextStyle(fontSize: 60))),
========
      : Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
              setState(() {
              _index += 1;
          });
            
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text('Step 1: Insert chip'),
              isActive: _index > 0,
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Make sure your chip is connected to your smartbox')),
            ),
            Step(
              title: const Text('Step 2: Insert chip'),
              isActive: _index > 0,
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Make sure your chip is connected to your smartbox')),
            ),
            Step(
              title: const Text('Step 3: Insert chip'),
              isActive: _index > 0,
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Make sure your chip is connected to your smartbox')),
            ),
          ],
          ),
          

>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
      ),
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(
          label: 'HOME',
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: 'SETTINGS',
          icon: Icon(Icons.settings)
<<<<<<<< HEAD:smart_foodbox/lib/main.dart
        )
      ],
      currentIndex: currentIndex,
      onTap: (int index){
        setState(() {
          currentIndex = index;
        });
      },
      ),
========
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
        });
      },
      ),
      


>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
    );
  }
}

<<<<<<<< HEAD:smart_foodbox/lib/main.dart
========

>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart
class MySelectionItem extends StatelessWidget {
  final String? title;
  final bool isForList;

  const MySelectionItem({Key? key, this.title, this.isForList = true})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
        ? Padding(
          child: _buildItem(context),
          padding: const EdgeInsets.all(10.0),
        )
        : Card(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child:  Stack(
            children: <Widget>[
              _buildItem(context),
              const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_drop_down),
              )
            ],
          ),
        ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          title!,
    )),
    );
  }
}
<<<<<<<< HEAD:smart_foodbox/lib/main.dart

========
>>>>>>>> 6060f4d36c97a9875557a7407f75031d41da131e:smartbox/lib/main.dart

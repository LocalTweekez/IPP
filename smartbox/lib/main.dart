
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:direct_select/direct_select.dart';
<<<<<<< HEAD
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import './BluetoothPage.dart';
=======
import './BluetoothPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


double _temp = tempArduino;
bool toCelcius = true;
>>>>>>> d6333c646d6621a3ade071b4e88baa5cf1e9f422

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Smart Matlåda'), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
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

  void _onDegreeChange(bool value) {
    setState(() {
      toCelcius = value;
    });
  }


  final elements1 = [
    "0°C", "1°C", "2°C", "3°C", "4°C", "5°C", "6°C", "7°C", "8°C", "9°C", "10°C", "11°C", "12°C", "13°C", "14°C", "15°C", "16°C", "17°C", "18°C", "19°C", "20°C",
    "21°C", "22°C", "23°C", "24°C", "25°C", "26°C", "27°C", "28°C", "29°C", "30°C", "31°C", "32°C", "33°C", "34°C", "35°C", "36°C", "37°C", "38°C", "39°C", "40°C", 
    "41°C", "42°C", "43°C", "44°C", "45°C", "46°C", "47°C", "48°C", "49°C", "50°C", "51°C", "52°C", "53°C", "54°C", "55°C", "56°C", "57°C", "58°C", "59°C", "60°C",
    "61°C", "62°C", "63°C", "64°C", "65°C", "66°C", "67°C", "68°C", "69°C", "70°C", "71°C", "72°C", "73°C", "74°C", "75°C", "76°C", "77°C", "78°C", "79°C", "80°C",
    "81°C", "82°C", "83°C", "84°C", "85°C", "86°C", "87°C", "88°C", "89°C", "90°C", "91°C", "92°C", "93°C", "94°C", "95°C", "96°C", "97°C", "98°C", "99°C", "100°C",
  ];
  int? selectedIndex1 = 0;

  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
          title: val,
        ))
        .toList();
  }

  void _increaseTemp() {
    if(toCelcius = true) {
      setState(() {
        _temp++;
      });
    }
    else{
      setState(() {
        _temp++;
      });      
    }
  }
  
  void _decreaseTemp() {
    setState(() {
      _temp--;
    });
  }

  String _celciusToFarenheit(double cTemp) {
    double fTemp = (cTemp * 1.8) + 32;
    String fString = '$fTemp°F'; 
    return fString;
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
        
        title: Text("Smartbox", style: const TextStyle(fontFamily: 'Lobster'),),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _currentIndex == 0 ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              radius: 300,
              backgroundColor: Colors.grey.shade300,
              lineWidth: 10,
              progressColor: _temp < 30 ? Colors.blue.shade400 : Colors.red.shade400, 
              percent: _temp / 100,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: 1200,
              center: 
              InkWell(
                child: toCelcius ? 
                Text(
                '$_temp°C',
                 style: Theme.of(context).textTheme.headline4,
                )
                :Text(
                  _celciusToFarenheit(_temp),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            DirectSelect(
              itemExtent: 50.0,
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
                  "Tap the temperature value to switch to Farenheit!",
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
                ElevatedButton(
                  onPressed: () {
                    if(toCelcius = true){
                      toCelcius = false;
                      _temp = 50;
                    }
                    else{
                      toCelcius = true;
                      _temp = 10;
                    };
                    }, 
                  child: Text("Switch degree"))
              ],
            )
          ],
        ) 
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
            if(_index == 2){
              setState(() {
                _index -= 1;
              });
            }
            else{
              setState(() {
                _index += 1;
              });
            }

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
              content: 
<<<<<<< HEAD
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Make sure your chip is connected to your smartbox')),
=======
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Make sure your chip is connected to your smartbox')),
>>>>>>> d6333c646d6621a3ade071b4e88baa5cf1e9f422
            ),
            Step(
              title: const Text('Step 2: Connect to bluetooth'),
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
      ),
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(
          label: 'HOME',
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: 'SETUP',
          icon: Icon(Icons.settings)
        ),
        BottomNavigationBarItem(
          label: 'BLUETOOTH',
          icon: Icon(Icons.bluetooth)
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
          // ignore: avoid_print
          print(index);
        });
        if(index == 2) {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BluetoothPage()));
          });
        }
        ;
      },
      ),
    );
  }
}



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

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BookForm()));
}

class BookForm extends StatefulWidget {
  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  final bookname = TextEditingController();
  final author = TextEditingController();
  final price = TextEditingController();
  final quantity = TextEditingController();

  String message = "";

  void checkBook() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        message = "Accepted!";
      });
    } else {
      setState(() {
        message = "Rejected :(";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book details")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: bookname,
                  decoration: InputDecoration(labelText: "Book Name"),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Enter book name";
                    }
                    if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return "Only letters allowed";
                    }
                  },
                ),
                TextFormField(
                  controller: author,
                  decoration: InputDecoration(labelText: "Author"),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Enter author";
                    }
                    if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return "Only letters allowed";
                    }
                  },
                ),
                TextFormField (
                  controller: quantity,
                  decoration: InputDecoration(labelText: "Quantity"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Enter price";
                    }
                    
                    final parsedValue = int.tryParse(value);
                    if(parsedValue == null) {
                      return "Enter a valid number";
                    }
                    if(parsedValue < 0) {
                      return "Negative numbers are not allowed";
                    }
                    
                    return null;
                  },
                ),
                TextFormField(
                  controller: price,
                  decoration: InputDecoration(labelText: "Price"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Enter price";
                    }
                    
                    final parsedValue = int.tryParse(value);
                    if(parsedValue == null) {
                      return "Enter a valid number";
                    }
                    if(parsedValue < 0) {
                      return "Negative numbers are not allowed";
                    }

                    return null;
                  }
                ),
                ElevatedButton(
                  onPressed: checkBook, 
                  child: Text("Submit"),
                ),
                SizedBox(height: 20),
                Text(
                  message,
                  style: TextStyle(fontSize: 18)
                ),
              ],
            )
        )
      )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  int _counter = 0;

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

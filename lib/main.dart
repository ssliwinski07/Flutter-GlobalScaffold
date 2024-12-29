import 'package:flutter/material.dart';
import 'package:flutter_global_scaffold/core/services.dart';
import 'package:flutter_global_scaffold/core/trackers/future_tracker.dart';
import 'package:flutter_global_scaffold/helpers/helpers.dart';

void main() async {
  await ServiceLocator.initializeCoreUIServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: MessageServiceMain.scaffoldMsgKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  MessageServiceBase get messageService =>
      ServiceLocator.getIt<MessageServiceBase>(instanceName: mainInstance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FutureTracker<void>(
            () => _increaseCounter(),
            messageService: messageService,
            successMsg: "Counter increased",
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _increaseCounter() async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (DateTime.now().second % 2 == 0) {
      throw "Database error. Please contact administrator.";
    }
    _counter++;
    setState(() {});
  }
}

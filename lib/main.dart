import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:flutter_global_scaffold/core/mobx_stores.dart';
import 'package:flutter_global_scaffold/core/services.dart';
import 'package:flutter_global_scaffold/core/trackers/future_tracker.dart';
import 'package:flutter_global_scaffold/helpers/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.initializeCoreUIServices();

  MessageServiceBase messageService =
      ServiceLocator.getIt<MessageServiceBase>(instanceName: mainInstance);

  runApp(
    MultiProvider(
      providers: [
        Provider<CounterStore>(
          create: (context) => CounterStore(),
        ),
      ],
      child: MyApp(
        onBuild: () {
          messageService.init();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.onBuild});

  final VoidCallback? onBuild;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (onBuild != null) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              onBuild!();
            },
          );
        }
        return MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: navigatorKey,
          builder: FToastBuilder(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(
            title: 'Flutter Demo Home Page',
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  MessageServiceBase get messageService =>
      ServiceLocator.getIt<MessageServiceBase>(instanceName: mainInstance);

  @override
  Widget build(BuildContext context) {
    CounterStore counterStore =
        Provider.of<CounterStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) => Text(
                '${counterStore.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FutureTracker<void>(
            () => counterStore.increaseCounter(),
            messageService: messageService,
            successMsg: "Counter increased",
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

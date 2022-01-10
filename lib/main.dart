import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_app/theme/theme_constants.dart';
import 'package:theme_app/utils/helper_widgets.dart';

final _themeManagerProvider = StateProvider<bool>((ref) {
  return false;
});

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(_themeManagerProvider.state).state ? ThemeMode.dark : ThemeMode.light,
      home: Home(),
    );
  }
}

class Home extends ConsumerWidget {
  Home({Key? key}) : super(key: key);

  final double imageSize = 160.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme App'),
        actions: [
          Switch(
              value: ref.watch(_themeManagerProvider.state).state,
              onChanged: (value) {
                ref.read(_themeManagerProvider.state).state = value;
              }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/user.png',
                width: imageSize,
                height: imageSize,
              ),
              addVerticalSpace(10),
              Text(
                'Your Name',
                style: _textTheme.headline4,
              ),
              addVerticalSpace(10),
              Text(
                '@yourusername',
                style: _textTheme.subtitle1?.copyWith(color: Theme.of(context).primaryColor),
              ),
              addVerticalSpace(10),
              Text(
                'This is a simple status',
              ),
              addVerticalSpace(20),
              TextField(),
              addVerticalSpace(20),
              ElevatedButton(
                child: Text('Just click'),
                onPressed: () {
                  // do stuff
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          const snackBar = SnackBar(
            content: Text('A SnackBar!'),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}

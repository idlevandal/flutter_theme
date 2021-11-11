import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_app/theme/theme_constants.dart';
import 'package:theme_app/utils/helper_widgets.dart';

final _themeManagerProvider = StateProvider<bool>((ref) {
  return false;
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(_themeManagerProvider.state).state ? ThemeMode.dark : ThemeMode.light,
      home: const Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  final double imageSize = 160.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('run build...');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme App'),
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
          padding: const EdgeInsets.all(8.0),
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
              const Text(
                'Your Name',
              ),
              addVerticalSpace(10),
              const Text(
                '@yourusername',
              ),
              addVerticalSpace(10),
              const Text(
                'This is a simple status',
              ),
              addVerticalSpace(20),
              const TextField(),
              addVerticalSpace(20),
              ElevatedButton(
                child: const Text('Just click'),
                onPressed: () {
                  ref.read(_themeManagerProvider.state).state = !ref.read(_themeManagerProvider.state).state;
                  print(ref.read(_themeManagerProvider.state).state);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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

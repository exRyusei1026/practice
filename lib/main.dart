import 'package:comic_viwer_practice/game/game_screen.dart';
import 'package:comic_viwer_practice/horizontal_reader/horizontal_reader_screen.dart';
import 'package:comic_viwer_practice/vertical_reader/vertical_reader_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const HorizontalReaderScreen(),
                fullscreenDialog: true,
              )),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow[200]!),
              ),
              child: const Text(
                'to horizontal comic viewer',
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const VerticalReaderScreen(),
                fullscreenDialog: true,
              )),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow[200]!),
              ),
              child: const Text(
                'to vertical comic viewer',
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => GameWidget(game: GameScreen()),
                fullscreenDialog: true,
              )),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow[200]!),
              ),
              child: const Text(
                'to game',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

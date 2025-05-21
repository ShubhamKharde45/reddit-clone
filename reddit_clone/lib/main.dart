import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/providers/authprovider.dart';
import 'package:reddit_clone/screens/homepagescreen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(AuthStatusProvider.notifier).state == true) {
      return MaterialApp(debugShowCheckedModeBanner: false, home: HomePageUI());
    } else {
      return MaterialApp(debugShowCheckedModeBanner: false, home: HomePageUI());
    }
  }
}

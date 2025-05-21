import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/providers/createpostproviders.dart';
import 'package:reddit_clone/utils/apptextfield.dart';

class Addtagsscreen extends ConsumerStatefulWidget {
  const Addtagsscreen({super.key});

  @override
  ConsumerState<Addtagsscreen> createState() => _AddtagsscreenState();
}

class _AddtagsscreenState extends ConsumerState<Addtagsscreen> {
  void AddValue(String value) {
    final prov = ref.watch(SelectedTagsProvider);
    prov.add(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(CupertinoIcons.arrow_left),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Apptextfield(
              hintext: "# press enter ",
              onSubmitted: (value) => AddValue(value),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ref.read(SelectedTagsProvider).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        "#" + ref.read(SelectedTagsProvider)[index],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

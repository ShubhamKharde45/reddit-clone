import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/providers/createpostproviders.dart';
import 'package:reddit_clone/utils/apptextfield.dart';

class Selectcommunityscreen extends ConsumerStatefulWidget {
  const Selectcommunityscreen({super.key});

  @override
  ConsumerState<Selectcommunityscreen> createState() => _AddtagsscreenState();
}

class _AddtagsscreenState extends ConsumerState<Selectcommunityscreen> {
  void AddValue(String value) {
    final prov = ref.watch(SelectedCommunityProvider);
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
              hintext: "/ press enter ",
              onSubmitted: (value) => AddValue(value),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ref.read(SelectedCommunityProvider).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        "/" + ref.read(SelectedCommunityProvider)[index],
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

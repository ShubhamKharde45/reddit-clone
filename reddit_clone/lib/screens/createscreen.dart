import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/providers/createpostproviders.dart';
import 'package:reddit_clone/providers/filepickerproviders.dart';
import 'package:reddit_clone/screens/addtagsscreen.dart';
import 'package:reddit_clone/screens/selectcommunitysceen.dart';
import 'package:reddit_clone/service/postuploadservice.dart';
import 'package:reddit_clone/utils/apptextfield.dart';

class CreateScreen extends ConsumerStatefulWidget {
  const CreateScreen({super.key});

  @override
  ConsumerState<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends ConsumerState<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedFilesPath = ref.watch(SelectedFilesPathProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.multiply, color: Colors.white, size: 30),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await Postuploadservice().uploader();
              Navigator.pop(context);
            },
            child: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "Post",
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Selectcommunityscreen(),
                    ),
                  );
                },
                child: Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.add_circled,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Select a community",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.arrow_up_arrow_down_circle,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Apptextfield(
                      hintext: "Title",
                      onSubmitted: (value) {
                        ref
                            .read(SelectedTitleProvider.notifier)
                            .update((state) => value);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Addtagsscreen()),
                  );
                },
                child: Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        CupertinoIcons.add_circled,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Add tags",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.arrow_up_arrow_down_circle,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade700,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child:
                      selectedFilesPath.isEmpty
                          ? Center(
                            child: Text(
                              "Selected Files",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          )
                          : ListView.builder(
                            itemCount: selectedFilesPath.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:
                                (context, index) => Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 5,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: FileImage(
                                        File(selectedFilesPath[index]),
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                margin: EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.link, color: Colors.grey.shade600, size: 30),
                    IconButton(
                      onPressed: () async {
                        FileClass fileClass = FileClass();
                        await fileClass.SelectImageFromGallery();
                        if (fileClass.file != null) {
                          ref
                              .read(SelectedFilesPathProvider)
                              .add(fileClass.file!.path);
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.image),
                      color: Colors.grey.shade600,
                    ),
                    Icon(
                      Icons.video_call,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    Icon(Icons.poll, color: Colors.grey.shade600, size: 30),
                    Icon(Icons.chat, color: Colors.grey.shade600, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

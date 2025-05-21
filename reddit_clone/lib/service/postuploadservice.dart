import 'dart:io';

class Postuploadservice {
  Future<void> uploader() async {
    sleep(Duration(seconds: 3));
    print("done");
  }

  Future<Map> uploadtoCloudinary() async {
    Map map = {"data": "null"};
    return map;
  }

  Future<void> uploadtoToDB() async {}
}

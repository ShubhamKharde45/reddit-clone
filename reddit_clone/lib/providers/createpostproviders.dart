import 'package:riverpod/riverpod.dart';

final SelectedTitleProvider = StateProvider((ref) {
  String? title;
  return title;
});

final SelectedTagsProvider = StateProvider((ref) {
  List added_tags = ["ask"];
  return added_tags;
});

final SelectedCommunityProvider = StateProvider((ref) {
  List added_community = [];
  return added_community;
});

final SelectedFilesPathProvider = StateProvider((ref) {
  List selected_files_paths = [];
  return selected_files_paths;
});


final PostUploadProvider = StateProvider((ref) {
  
  
});

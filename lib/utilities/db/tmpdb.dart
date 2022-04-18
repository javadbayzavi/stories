//TODO: Acceptance Criteria #2: Change the name of the file to a conventional and meaningful name, and turn it to a db class
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kidstories/models/story_details_model.dart';
import 'package:kidstories/models/story_model.dart';
import 'package:http/http.dart' as http;
import 'package:kidstories/utilities/network/network.dart';


Future<StoryDetails> getStory(String storyId) async {
  final response = 
    await new http.Client().get(Story_getStory + AddressSeparator + storyId);
  
  final parsed = json.decode(response.body);
  return StoryDetails.fromJson(parsed);
}

Future<List<Story>> getStoriesFromStore(http.Client client) async {
  final response =
      await client.get(Story_getStories);

  // Use the compute function to run parseStories in a separate isolate.
  return compute(parseStory, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Story> parseStory(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Story>((json) => Story.fromJson(json)).toList();
}

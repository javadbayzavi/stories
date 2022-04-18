  import 'dart:async';

import 'package:flutter/cupertino.dart';

//TODO: Acceptance Criteria #3: Add some other properties to the StoryImage Widget such as height , width and offline image
class StoryImage extends StatelessWidget
{
  //Url refere to the place of Image
  String imageUrl;

  //Widget Constructor
  StoryImage(String url)
  {
    this.imageUrl = url;
  }

  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          child: FutureBuilder<Widget>(
            future: getImage(this.imageUrl),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              } else {
                //TODO: Acceptance Criteria #4: Turn this message to a meaningful widget to show loading progress
                return Text('LOADING...');
              }
            },
          ),
        );
  }
  
  Future<Widget> getImage(String url) async {
    final Completer<Widget> completer = Completer();

    final image = NetworkImage(url);
    final config = await image.obtainKey(const ImageConfiguration());
    final load = image.load(config);

    final listener = new ImageStreamListener((ImageInfo info, isSync) async {
      print(info.image.width);
      print(info.image.height);

      if (info.image.width == 80 && info.image.height == 160) {
        completer.complete(Container(child: Text('AZAZA')));
      } else {
        completer.complete(Container(child: Image(image: image)));
      }
    });

    load.addListener(listener);
    return completer.future;
  }
}
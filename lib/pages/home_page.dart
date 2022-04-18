


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kidstories/components/imageutil.dart';
import 'package:kidstories/models/story_model.dart';
import 'package:kidstories/pages/storycataloge_page.dart';
import 'package:kidstories/utilities/db/tmpdb.dart';
import 'package:http/http.dart' as http;
import 'package:kidstories/utilities/network/network.dart';


//TODO : All pages in app must be added to this list and called apropriately based on tapping on related buttom tab item
const List<Widget> pages = <Widget>[
  
];


class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  Future<List<Story>> stories;
  @override
  void initState() {
    super.initState();
    stories = getStoriesFromStore(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _generateHomeFromStore(),
      title: 'Welcome to Sotries',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(230, 230, 230, 1),
      ),
    );
}
 
  Widget _generateHomeFromStore()
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("List from data store"),
      ),
      body: FutureBuilder<List<Story>>(
        future: stories,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          {
            return ListView.builder(
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index)
              {
                Story item = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    loadStoryDetail(item.id.toString());
                    },
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Colors.green,
                        elevation: 2.0,
                        margin: EdgeInsets.symmetric(
                          horizontal:10.0,
                          vertical:6.0),
                        child: Container(
                                  // decoration: BoxDecoration(
                                  //   color: Colors.white
                                  // ),
                                  // padding: EdgeInsets.all(25),
                                  // margin: EdgeInsets.all(10),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                      vertical: 10.0,
                                    ),
                                    leading:Stack(
                                      children: <Widget>[
                                        Container
                                        (
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.green[200],
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          height: 90,
                                          width: 90,
                                          //child: StoryImage(ServerBaseAddress + item.logo),
                                        ),
                                        StoryImage(ServerBaseAddress + item.logo),
                                      ],
                                    ),
                                    onTap: (){
                                      loadStoryDetail(item.id.toString());
                                    },
                                    title: Text(item.title),
                                    subtitle: Text(item.lid),
                                  ),
                                ),
                      )
                    ],
                  ),
                );
              },
            );
          }
          else
          {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );

  }
  void loadStoryDetail(String storyId)
  {
    Navigator.push(
      context, 
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => StoryCataloge(storyId),
      ),
    );
  }
}

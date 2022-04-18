import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kidstories/models/story_details_model.dart';
import 'package:kidstories/utilities/db/tmpdb.dart';
import 'package:kidstories/utilities/network/network.dart';
import 'package:kidstories/components/imageutil.dart';

//TODO: Acceptance Criteria #5: Add Like and Dislike Feature to this page
class StoryCataloge extends StatefulWidget{
  String storyId;
  Future<StoryDetails> item;

  StoryCataloge(String id)
  {
    this.storyId = id;
  }
    _StoryCataloge createState() => _StoryCataloge();
}
class _StoryCataloge extends State<StoryCataloge> with TickerProviderStateMixin
{
  StoryDetails retrievedStory;

  //An observer that control and coordinate the behavior of the comments tabs
  TabController _commentTabController;

  final String lid = "اين داستان در مورد يك چيز عجيب هست كه خيلي خيلي غريب بايد برود در تابستان كار سختي پيش رو دارد باران به صورت نم نم بر پيشناني مرد فرود سختي خواهد داشت تا كسي باشد و ببيند كه اين روزگار چرايي و چگونگي تركيب عناصر را نشان مي‌دهد.";

  @override
  void initState() {
    super.initState();
    _commentTabController = TabController(vsync: this, length: 2);
    widget.item = getStory(widget.storyId);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Story Details",
        textDirection: TextDirection.rtl,
        ),
        elevation: 1.0,
        centerTitle: true,
        leading: Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward
            ),
            onPressed: ()
            {
              //Dispose the retrieved story from remote source and free the memory
              retrievedStory = null;

              Navigator.of(context).pop();
            },
          )
        ],
      ), 
      body: SafeArea(
        child: FutureBuilder<StoryDetails>(
          future: widget.item,
          builder: (context, snapshot)
          {
            if(snapshot.hasData)
            { 
              this.retrievedStory = snapshot.data;
              return ListView(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                children: <Widget>[
                  //Story Logo image of the story at the top of the page
                  //Acceptance Criteria #8: Image must be spaned and fitted to the size of the device and it must be a carousel widget
                 Container(
                    child: SizedBox(
                              child: StoryImage(ServerBaseAddress + snapshot.data.storyLogo),
                            ),
                    margin: EdgeInsets.only(bottom: 20),
                  ),

                  //Story Details section
                  makeStoryDetailBody(),
                  SizedBox(
                    height: 10,
                  ),
                  makeActionButtons(),
                  //makeCommentsTabs(),
                ],
              );
            }
            else
            {
              return Center(
                child: CircularProgressIndicator(),
                );
            }
          }
          ,
          ),
        ),
    );
  }

Border CustomBorderStyle()
{
  return Border.all(
    color: Color.fromRGBO(230, 230, 230, 1),
    width: 1.0,
  );
}


Container makeStoryDetailBody()
{
  
  return Container(
    width: double.infinity,
    margin: EdgeInsets.fromLTRB(10,5,10,5),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      boxShadow:  [
          new BoxShadow(
            color: Colors.grey[300],
            blurRadius: 2,
            spreadRadius: 1,
            offset: new Offset(0.0,3)
          ),
          ],
      color: Colors.white,
      border: CustomBorderStyle()
    ),
    child: Column(
      children: <Widget>[
      
        
        //Story Title 
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            retrievedStory.storyTitle,
            style: TextStyle(
              //TODO: Acceptance Criteria #7: Font style must be parametrized and be configurable by either developer or end user
              fontSize: 42
            ),
            ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),

        Container(
          alignment: Alignment.centerRight,
          child: Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              //The avatar of the story author
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange,
                    style: BorderStyle.solid
                  )
                ),
              ),
              Text(
                retrievedStory.storyAuthors,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 20,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        Divider(
        )
        ,
        //Story Lid
        Container(
          alignment: Alignment.centerRight,
          child: Text(retrievedStory.storyLid + " " + lid ,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.justify,
                style: TextStyle(
              //TODO: Acceptance Criteria #7: Font style must be parametrized and be configurable by either developer or end user
              fontSize: 25
            ),
          ),
          padding: EdgeInsets.fromLTRB(0,10,0,5),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),

        Divider(

        ),
        //Story Tags
        Container(
          alignment: Alignment.centerRight,
          //TODO: Acceptance Criteria #9: All the messages must be inverted into cultural based and language setting of the target os
          child: ((retrievedStory.storyTags != null)? Text(retrievedStory.storyTags) : Text("كليد واژه‌اي وجود ندارد")),
          margin: EdgeInsets.fromLTRB(0,5,0,5),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}


Row makeActionButtons()
{
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      RaisedButton(
        elevation: 5,
        padding: EdgeInsets.all(20),
        shape:  RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.red)
        ),
        onPressed: (){
          //TODO: Add to my wachlist feature must be developed here
        },
        child: Text(
          "افزودن به علاقه‌مندي",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
          ),
        color: Colors.red,
        textColor: Colors.white,
      ),

      SizedBox(width:20),
      RaisedButton(
        elevation: 5,
        padding: EdgeInsets.all(20),
        shape:  RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.green)
        ),
        onPressed: (){
          //TODO: Add to my library feature must be developed here
        },
        child: Text(
            "افزودن به كتابخانه من",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        color: Colors.green,
        textColor: Colors.white,
      ),
    ],
  );
}

ListView makeCommentsTabs()
  {
    return ListView(
          children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
            child: new TabBar(
              controller: _commentTabController,
              tabs: [
                new Tab(
                  icon: const Icon(Icons.home),
                  text: 'Address',
                ),
                new Tab(
                  icon: const Icon(Icons.my_location),
                  text: 'Location',
                ),
              ],
            ),
          ),

          Container(
            height: 80.0,
            child: new TabBarView(
              controller: _commentTabController,
              children: <Widget>[
                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.home),
                    title: new TextField(
                      decoration: const InputDecoration(hintText: 'Search for address...'),
                    ),
                  ),
                ),
                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.location_on),
                    title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                    trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                  ),
                ),
              ],
            ),
          ),                      
        ],
      );
  }
}

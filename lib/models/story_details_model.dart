import 'package:kidstories/models/category_model.dart';

class StoryDetails {
  int storyId;
  String storyTitle;
  String storyLid;
  String storyLogo;
  String storyBody;
  int storyValidUntil;
  int storyPublishDate;
  String storyAuthors;
  bool storyShowOnFirstPage;
  String storyTags;
  List<Category> storyCategories;
  
  StoryDetails(
      {
        this.storyId,
        this.storyTitle,
        this.storyLid,
        this.storyBody,
        this.storyAuthors,
        this.storyLogo,
        this.storyPublishDate,
        this.storyValidUntil,
        this.storyShowOnFirstPage,
        this.storyTags,
        this.storyCategories
      } 
    );  

  factory StoryDetails.fromJson(Map<String, dynamic> json)
  {
     return StoryDetails( 
       storyId : json['Id'],
      storyTitle : json['Title'],
      storyLid : json['Lid'],
      storyBody : json['Body'],
      storyLogo : json['LogoAddress'],
      storyAuthors : json['Authors'],
      storyPublishDate : json['Publishdate'],
      storyValidUntil : json['Validuntil'],
      storyTags : json['Tags'],
      storyShowOnFirstPage : json['ShowOnFirstPage'],
      //storyCategories : json['Categories']
     );
  }
  Map<String, dynamic> toJson() =>
  {
    'Id' : this.storyId,
    'Title' : this.storyTitle,
    'Lid' : this.storyLid,
    'Body' : this.storyBody,
    'LogoAddress' : this.storyLogo,
    'Authors' : this.storyAuthors,
    'PublishDate' : this.storyPublishDate,
    'ValidUntil' : this.storyValidUntil,
    'Tags' : this.storyTags,
    'ShowOnFirstPage' : this.storyShowOnFirstPage,
    'Categories' : this.storyCategories
  };
}


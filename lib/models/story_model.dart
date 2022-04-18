//TODO: Acceptance Criteria #1: Review the Story Model and check for field's compatibility with remote data store
class Story {
  int id;
  String title;
  String lid;
  String logo;
  String authors;

  Story({
        this.id,
        this.title,
        this.lid,
        this.authors,
        this.logo
      }
    );  

  factory Story.fromJson(Map<String, dynamic> json)
  {
    return Story( 
      id : json['Id'],
      title : json['Title'],
      lid : json['Lid'],
      logo : json['LogoAddress'],
      authors : json['Authors'],
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'id' : this.id,
    'title' : this.title,
    'lid' : this.lid,
    'logo' : this.logo,
    'authors' : this.authors,
  };

}


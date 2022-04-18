class Category {
  int categoryId;
  String categoryTitle;
  String categoryParent;
  String categoryUniqueName;
  
  Category(
    this.categoryId,this.categoryTitle,this.categoryParent,this.categoryUniqueName
    );

  Category.fromJson(Map<String, dynamic> json)
  : this.categoryId = json['id'],
  this.categoryTitle = json['title'],
  this.categoryParent = json['pid'],
  this.categoryUniqueName = json['uniquename'];

  Map<String, dynamic> toJson() =>
  {
    'id' : this.categoryId,
    'title' : this.categoryTitle,
    'pid' : this.categoryParent,
    'uniquename' : this.categoryUniqueName,
  };


 
}


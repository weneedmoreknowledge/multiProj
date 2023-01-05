class User{
  int user_id;
  String user_name;
  String user_email;
  String user_password;
  String user_gender;
  DateTime user_DOB;
  String user_PIN;

  User(
      this.user_id,
      this.user_name,
      this.user_email,
      this.user_password,
      this.user_gender,
      this.user_DOB,
      this.user_PIN,
  );

  factory User.fromJson(Map<String,dynamic>json)=>User(
    int.parse(json["user_id"]),
    json["user_name"],
    json["mail"],
    json["pass"],
    json["gender"],
    DateTime.parse(json["DOB"]),
    json["PIN"],
  );

  Map<String,dynamic> toJson()=>{
    'user_id':user_id.toString(),
    'user_name':user_name,
    'mail':user_email,
    'pass':user_password,
    'gender':user_gender,
    'DOB':user_DOB.toString(),
    'PIN':user_PIN,
  };
}

class FeedBack{
  int id;
  int user_id;
  String title;
  String feed_contents;

  FeedBack(
      this.id,
      this.user_id,
      this.title,
      this.feed_contents
      );

  factory FeedBack.fromJson(Map<String,dynamic>json)=>FeedBack(
    int.parse(json["report_id"]),
    int.parse(json["user_id"]),
    json["title"],
    json["feed_contents"],
  );

  Map<String,dynamic> toJson()=>{
    'report_id':id.toString(),
    'user_id':user_id.toString(),
    'title':title,
    'feed_contents':feed_contents
  };
}

class History{
  String user_email;
  String checkDate;

  History(
      this.user_email,
      this.checkDate
      );

  factory History.fromJson(Map<String,dynamic>json)=>History(
    json["user_email"],
    json["check_date"],
  );

  Map<String,dynamic> toJson()=>{
    'user_email':user_email,
    'check_date':checkDate,
  };
}

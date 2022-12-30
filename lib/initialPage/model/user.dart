class User{
  int user_id;
  String user_name;
  String user_email;
  String user_password;

  User(
      this.user_id,
      this.user_name,
      this.user_email,
      this.user_password
  );

  factory User.fromJson(Map<String,dynamic>json)=>User(
      int.parse(json["user_id"]),
      json["user_name"],
      json["user_email"],
      json["user_password"],
  );

  Map<String,dynamic> toJson()=>{
    'user_id':user_id.toString(),
    'user_name':user_name,
    'user_email':user_email,
    'user_password':user_password,
  };
}

class FeedBack{
  int id;
  String user_name;
  String user_email;
  String phone_number;
  String feed_contents;

  FeedBack(
      this.id,
      this.user_name,
      this.user_email,
      this.phone_number,
      this.feed_contents
      );

  factory FeedBack.fromJson(Map<String,dynamic>json)=>FeedBack(
    int.parse(json["id"]),
    json["user_name"],
    json["user_email"],
    json["user_phone"],
    json["feed_contents"],
  );

  Map<String,dynamic> toJson()=>{
    'id':id.toString(),
    'user_name':user_name,
    'user_email':user_email,
    'user_phone':phone_number,
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

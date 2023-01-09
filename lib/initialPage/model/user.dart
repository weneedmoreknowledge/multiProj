class User{
  int user_id;
  String user_name;
  String user_email;
  String user_password;
  String user_gender;
  DateTime user_DOB;
  int user_PIN;

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
    int.parse(json["PIN"]),
  );

  Map<String,dynamic> toJson()=>{
    "user_id":user_id.toString(),
    "user_name":user_name,
    "mail":user_email,
    "pass":user_password,
    "gender":user_gender,
    "DOB":user_DOB.toString(),
    "PIN":user_PIN.toString(),
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
    json["description"],
  );

  Map<String,dynamic> toJson()=>{
    'report_id':id.toString(),
    'user_id':user_id.toString(),
    'title':title,
    'description':feed_contents
  };
}

class History{
  int log_id;
  int user_id;
  DateTime time;
  int check_in_out;

  History(
      this.log_id,
      this.user_id,
      this.time,
      this.check_in_out,
      );

  factory History.fromJson(Map<String,dynamic>json)=>History(
    int.parse(json["log_id"]),
    int.parse(json["user_id"]),
    DateTime.parse(json['time']),
    int.parse(json["check_in_out"]),
  );

  Map<String,dynamic> toJson()=>{
    'log_id':log_id.toString(),
    'user_id':user_id.toString(),
    'time':time.toString(),
    'check_in_out':check_in_out.toString()
  };
}

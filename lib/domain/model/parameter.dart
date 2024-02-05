class Parameter {
  final String Id;
  final String Email;
  final String First_Name;
  final String Last_Name;
  final String Avatar;

  Parameter({
    required this.Id,
    required this.Email,
    required this.First_Name,
    required this.Last_Name,
    required this.Avatar
  });

  factory Parameter.fromJson(Map<String,dynamic> json) {
    dynamic fromjson = json['data'];
    return Parameter(
      Id: fromjson['id'], 
      Email: fromjson['email'], 
      First_Name: fromjson['first_name'], 
      Last_Name: fromjson['last_name'], 
      Avatar: fromjson['avatar']);
  }
  
}
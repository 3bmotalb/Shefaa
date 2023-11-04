// ignore_for_file: prefer_collection_literals

class Medicine {
  int? id;
  String? name;
  int? iscompleted;
  String? date;
  String? starttime;
  int? interval;
  String? repet;
  int? image;

  Medicine(
      {this.id,
      this.name,
      this.iscompleted,
      this.date,
      this.starttime,
      this.interval,
      this.image,
      this.repet});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    starttime = json['starttime'];
    interval = json['interval'];
    repet = json['repet'];
    image = json['image'];
    iscompleted = json['iscompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['id'] = id;
    data['name'] = name;
    data['date'] = date;
    data['iscompleted'] = iscompleted;
    data['starttime'] = starttime;
    data['interval'] = interval;
    data['image'] = image;
    data['repet'] = repet;
    return data;
  }
}

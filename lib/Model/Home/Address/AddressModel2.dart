class Localization {
  List<Governorates>? governorates;
  List<Cities>? cities;

  Localization({this.governorates, this.cities});

  Localization.fromJson(Map<String, dynamic> json) {
    if (json['governorates'] != null) {
      governorates = <Governorates>[];
      json['governorates'].forEach((v) {
        governorates!.add(Governorates.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (governorates != null) {
      data['governorates'] = governorates!.map((v) => v.toJson()).toList();
    }
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Governorates {
  int? id;
  String? nameAr;
  String? nameEn;

  Governorates({this.id, this.nameAr, this.nameEn});

  Governorates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    return data;
  }
}

class Cities {
  int? id;
  int? govId;
  String? nameAr;
  String? nameEn;

  Cities({this.id, this.govId, this.nameAr, this.nameEn});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    govId = json['gov_id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gov_id'] = govId;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    return data;
  }
}

// class Governorates {
//   int? id;
//   String? name;
//
//   Governorates({this.id, this.name});
//
//   Governorates.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }
//
// class Cities {
//   int? id;
//   int? govId;
//   String? name;
//
//   Cities({this.id, this.govId, this.name});
//
//   Cities.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     govId = json['gov_id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['gov_id'] = govId;
//     data['name'] = name;
//     return data;
//   }
// }
//
// class Localization {
//   final List? governorates;
//   final List? cities;
//
//   Localization({this.governorates, this.cities});
//
//   factory Localization.fromJson(Map<dynamic, dynamic> json) {
//     return Localization(
//       governorates: parseStates(json),
//       cities: parseProvinces(json),
//     );
//   }
//
//   static List parseStates(governoratesJson) {
//     var govlist = governoratesJson['governorates'] as List;
//     List statesList =
//         govlist.map((data) => Governorates.fromJson(data)).toList();
//     return statesList;
//   }
//
//   static List parseProvinces(citiesJson) {
//     var plist = citiesJson['cities'] as List;
//     List cList = plist.map((data) => Cities.fromJson(data)).toList();
//     return cList;
//   }
// }

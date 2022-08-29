class DeviceType {
  int typeID = -1;
  String name = "";
  String color = "";
  String icon = "";

  DeviceType(
      {required this.typeID,
      required this.name,
      required this.color,
      required this.icon});

  DeviceType.fromJson(Map<String, dynamic> json) {
    typeID = json['typeID'];
    name = json['name'];
    color = json['color'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeID'] = typeID;
    data['name'] = name;
    data['color'] = color;
    data['icon'] = icon;
    return data;
  }
}

class RoutineModel {
  int id = 12345;
  int deviceId = 9876;
  String name = "";
  String time = "";
  String task = "";
  bool isActive = false;

  RoutineModel({
    required this.id,
    required this.deviceId,
    required this.name,
    required this.time,
    required this.task,
    required this.isActive,
  });

  RoutineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['deviceId'];
    name = json['name'];
    time = json['time'];
    task = json['task'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['deviceId'] = deviceId;
    data['name'] = name;
    data['time'] = time;
    data['task'] = task;
    data['isActive'] = isActive;
    return data;
  }
}

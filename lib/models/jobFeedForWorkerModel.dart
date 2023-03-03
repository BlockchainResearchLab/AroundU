class JobsFeedForWorkerModel {
  String? status;
  List<Data>? data;

  JobsFeedForWorkerModel({this.status, this.data});

  JobsFeedForWorkerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? description;
  String? type;
  String? priority;
  String? startDate;
  String? dueDate;
  int? price;
  String? status;
  int? providerID;
  int? workerID;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.title,
      this.description,
      this.type,
      this.priority,
      this.startDate,
      this.dueDate,
      this.price,
      this.status,
      this.providerID,
      this.workerID,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    priority = json['priority'];
    startDate = json['start_date'];
    dueDate = json['due_date'];
    price = json['price'];
    status = json['status'];
    providerID = json['providerID'];
    workerID = json['workerID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['priority'] = this.priority;
    data['start_date'] = this.startDate;
    data['due_date'] = this.dueDate;
    data['price'] = this.price;
    data['status'] = this.status;
    data['providerID'] = this.providerID;
    data['workerID'] = this.workerID;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

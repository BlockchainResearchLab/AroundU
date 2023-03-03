class JobDetailsForJobIDModel {
  String? status;
  Data? data;

  JobDetailsForJobIDModel({this.status, this.data});

  JobDetailsForJobIDModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? providerName;
  JobDetails? jobDetails;
  double? jobLatitude;
  double? jobLongitude;

  Data(
      {this.providerName,
      this.jobDetails,
      this.jobLatitude,
      this.jobLongitude});

  Data.fromJson(Map<String, dynamic> json) {
    providerName = json['provider_name'];
    jobDetails = json['job_details'] != null
        ? new JobDetails.fromJson(json['job_details'])
        : null;
    jobLatitude = json['job_latitude'];
    jobLongitude = json['job_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_name'] = this.providerName;
    if (this.jobDetails != null) {
      data['job_details'] = this.jobDetails!.toJson();
    }
    data['job_latitude'] = this.jobLatitude;
    data['job_longitude'] = this.jobLongitude;
    return data;
  }
}

class JobDetails {
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
  Null? workerID;
  String? createdAt;
  String? updatedAt;
  int? iV;

  JobDetails(
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

  JobDetails.fromJson(Map<String, dynamic> json) {
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

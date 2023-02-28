class JobDetailsOfJobIDForProvider {
  String? status;
  JobDetails? jobDetails;
  ProviderDetails? providerDetails;
  List<WorkersDetails>? workersDetails;
  LocationDetails? locationDetails;

  JobDetailsOfJobIDForProvider(
      {this.status,
      this.jobDetails,
      this.providerDetails,
      this.workersDetails,
      this.locationDetails});

  JobDetailsOfJobIDForProvider.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    jobDetails = json['job_details'] != null
        ? new JobDetails.fromJson(json['job_details'])
        : null;
    providerDetails = json['provider_details'] != null
        ? new ProviderDetails.fromJson(json['provider_details'])
        : null;
    if (json['workers_details'] != null) {
      workersDetails = <WorkersDetails>[];
      json['workers_details'].forEach((v) {
        workersDetails!.add(new WorkersDetails.fromJson(v));
      });
    }
    locationDetails = json['location_details'] != null
        ? new LocationDetails.fromJson(json['location_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.jobDetails != null) {
      data['job_details'] = this.jobDetails!.toJson();
    }
    if (this.providerDetails != null) {
      data['provider_details'] = this.providerDetails!.toJson();
    }
    if (this.workersDetails != null) {
      data['workers_details'] =
          this.workersDetails!.map((v) => v.toJson()).toList();
    }
    if (this.locationDetails != null) {
      data['location_details'] = this.locationDetails!.toJson();
    }
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

class ProviderDetails {
  int? id;
  String? name;
  String? image;
  String? phone;
  Null? rating;
  int? emailId;

  ProviderDetails(
      {this.id, this.name, this.image, this.phone, this.rating, this.emailId});

  ProviderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    rating = json['rating'];
    emailId = json['email_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['rating'] = this.rating;
    data['email_id'] = this.emailId;
    return data;
  }
}

class WorkersDetails {
  int? id;
  String? name;
  String? image;
  String? phone;
  Null? rating;
  String? location;
  int? emailId;
  String? skill1;
  String? skill2;
  String? skill3;
  String? skill4;
  Null? skill5;

  WorkersDetails(
      {this.id,
      this.name,
      this.image,
      this.phone,
      this.rating,
      this.location,
      this.emailId,
      this.skill1,
      this.skill2,
      this.skill3,
      this.skill4,
      this.skill5});

  WorkersDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    rating = json['rating'];
    location = json['location'];
    emailId = json['email_id'];
    skill1 = json['skill1'];
    skill2 = json['skill2'];
    skill3 = json['skill3'];
    skill4 = json['skill4'];
    skill5 = json['skill5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['rating'] = this.rating;
    data['location'] = this.location;
    data['email_id'] = this.emailId;
    data['skill1'] = this.skill1;
    data['skill2'] = this.skill2;
    data['skill3'] = this.skill3;
    data['skill4'] = this.skill4;
    data['skill5'] = this.skill5;
    return data;
  }
}

class LocationDetails {
  String? sId;
  String? jobID;
  Null? workerID;
  double? jobLat;
  double? jobLon;
  Null? workerOldLat;
  Null? workerOldLon;
  Null? workerNewLat;
  Null? workerNewLon;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LocationDetails(
      {this.sId,
      this.jobID,
      this.workerID,
      this.jobLat,
      this.jobLon,
      this.workerOldLat,
      this.workerOldLon,
      this.workerNewLat,
      this.workerNewLon,
      this.createdAt,
      this.updatedAt,
      this.iV});

  LocationDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jobID = json['jobID'];
    workerID = json['workerID'];
    jobLat = json['job_lat'];
    jobLon = json['job_lon'];
    workerOldLat = json['worker_old_lat'];
    workerOldLon = json['worker_old_lon'];
    workerNewLat = json['worker_new_lat'];
    workerNewLon = json['worker_new_lon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['jobID'] = this.jobID;
    data['workerID'] = this.workerID;
    data['job_lat'] = this.jobLat;
    data['job_lon'] = this.jobLon;
    data['worker_old_lat'] = this.workerOldLat;
    data['worker_old_lon'] = this.workerOldLon;
    data['worker_new_lat'] = this.workerNewLat;
    data['worker_new_lon'] = this.workerNewLon;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

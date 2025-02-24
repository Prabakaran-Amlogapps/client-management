class Project {
  final String id;
  final String projectName;
  final String clientName;
  final DateTime projectDate;
  final String location;
  final String contactPerson;
  final String contactNumber;
  final double totalCost;

  Project({
    required this.id,
    required this.projectName,
    required this.clientName,
    required this.projectDate,
    required this.location,
    required this.contactPerson,
    required this.contactNumber,
    required this.totalCost,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectName': projectName,
      'clientName': clientName,
      'projectDate': projectDate.toIso8601String(),
      'location': location,
      'contactPerson': contactPerson,
      'contactNumber': contactNumber,
      'totalCost': totalCost,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      projectName: map['projectName'],
      clientName: map['clientName'],
      projectDate: DateTime.parse(map['projectDate']),
      location: map['location'],
      contactPerson: map['contactPerson'],
      contactNumber: map['contactNumber'],
      totalCost: map['totalCost'],
    );
  }
}

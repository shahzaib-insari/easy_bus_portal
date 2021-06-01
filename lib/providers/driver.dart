class Driver {
  final String name;
  final int busNumber;
  final String vehicleNumber;
  List<String> routes;
  final int distanceCovered;
  final int Milage;
  List<String> studentRegistered;
  bool isEmergency;

  Driver(
      {this.name,
      this.busNumber,
      this.vehicleNumber,
      this.routes,
      this.distanceCovered,
      this.Milage,
      this.studentRegistered,
      this.isEmergency});
}

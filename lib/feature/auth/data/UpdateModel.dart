
class UpdateModel {
  final bool? forceUpdate;
  final String? version;

  const UpdateModel({
    this.forceUpdate,
    this.version,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      forceUpdate: json['force_update'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'force_update': forceUpdate,
      'version': version,
    };
  }
}
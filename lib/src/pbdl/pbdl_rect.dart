import 'package:json_annotation/json_annotation.dart';

part 'pbdl_rect.g.dart';

@JsonSerializable()
class PBDLRect {
  PBDLRect(
    this.x,
    this.y,
    this.width,
    this.height,
  );

  double x;
  double y;
  double width;
  double height;

  @override
  factory PBDLRect.fromJson(Map<String, dynamic> json) =>
      _$PBDLRectFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLRectToJson(this);
}

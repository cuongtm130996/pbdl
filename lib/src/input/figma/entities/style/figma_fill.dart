import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'figma_color.dart';
part 'figma_fill.g.dart';

@JsonSerializable()
class FigmaFill implements FigmaBaseNode {
  FigmaColor color;

  BlendMode blendMode;
  FillType fillType;

  FigmaFill(this.color, [this.isEnabled = true]);

  @JsonKey(defaultValue: true)
  bool isEnabled;

  Map<String, dynamic> toJson() => _$FigmaFillToJson(this);
  factory FigmaFill.fromJson(Map<String, dynamic> json) =>
      _$FigmaFillFromJson(json);

  PBDLFill interpretFill() {
    return PBDLFill(
      color?.interpretColor(),
      isEnabled,
    );
  }

  @override
  Future<PBDLNode> interpretNode() {
    // TODO: implement interpretNode
    throw UnimplementedError();
  }
}

enum BlendMode {
  NORMAL,
  DARKEN,
  MULTIPLY,
  COLOR_BURN,
  LIGHTEN,
  SCREEN,
  COLOR_DODGE,
  OVERLAY,
  SOFT_LIGHT,
  HARD_LIGHT,
  DIFFERENCE,
  EXCLUSION,
  HUE,
  SATURATION,
  COLOR,
  LUMINOSITY,
}
// enum FillType { SOLID, LINEAR,
//   RADIAL,
//   ANGULAR,
//   DIAMOND,
//   IMAGE,
// }

class FillType {}



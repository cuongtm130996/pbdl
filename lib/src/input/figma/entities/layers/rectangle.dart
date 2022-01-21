import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_rectangle.dart';
import '../../helper/style_extractor.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'rectangle.g.dart';

@JsonSerializable()
class FigmaRectangle extends FigmaVector
    with PBColorMixin
    implements AbstractFigmaNodeFactory {
  @override
  List<FigmaFill> fills;

  @override
  String type = 'RECTANGLE';
  FigmaRectangle({
    String name,
    bool isVisible,
    type,
    pluginData,
    sharedPluginData,
    FigmaStyle style,
    layoutAlign,
    FigmaConstraints constraints,
    boundaryRectangle,
    size,
    strokes,
    strokeWeight,
    strokeAlign,
    styles,
    this.cornerRadius,
    this.rectangleCornerRadii,
    this.points,
    this.fills,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name: name,
          visible: isVisible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          layoutAlign: layoutAlign,
          constraints: constraints,
          absoluteBoundingBox: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          fills: fills,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );

  List points;
  double cornerRadius;

  List<double> rectangleCornerRadii;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var node = FigmaRectangle.fromJson(json);
    // node.style = StyleExtractor().getStyle(json);
    return node;
  }

  factory FigmaRectangle.fromJson(Map<String, dynamic> json) =>
      _$FigmaRectangleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaRectangleToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    var fillsMap = (fills == null || fills.isEmpty) ? null : fills.first;
    if (fillsMap != null && fillsMap.type == 'IMAGE') {
      imageReference = FigmaAssetProcessor().processImage(UUID);

      return Future.value(PBDLImage(
        imageReference: imageReference,
        UUID: UUID,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        isVisible: isVisible,
        name: name,
        // style: style.interpretStyle(),  TODO: fix
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret(),
        layoutMainAxisSizing: getGrowSizing(layoutGrow),
        layoutCrossAxisSizing: getAlignSizing(layoutAlign),
      ));
    }
    return Future.value(
      PBDLRectangle(
        UUID: UUID,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        isVisible: isVisible,
        name: name,
        // style: style.interpretStyle(),  TODO: fix
        child: await child?.interpretNode(),
        fixedRadius: cornerRadius ?? 0,
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret(),
        layoutMainAxisSizing: getGrowSizing(layoutGrow),
        layoutCrossAxisSizing: getAlignSizing(layoutAlign),
      ),
    );
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();
}

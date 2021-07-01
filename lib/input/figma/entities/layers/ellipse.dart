
import 'package:pbdl/design_logic/pbdl_node.dart';
import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/vector.dart';
import 'package:pbdl/input/figma/helper/figma_asset_processor.dart';

import 'figma_node.dart';

part 'ellipse.g.dart';

@JsonSerializable(nullable: true)
class FigmaEllipse extends FigmaVector
    implements AbstractFigmaNodeFactory, Image {
  @override
  String imageReference;
  @JsonKey(ignore: true)
  Logger log;

  @JsonKey(ignore: true)
  var fills;

  @override
  String type = 'ELLIPSE';
  FigmaEllipse({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    style,
    layoutAlign,
    constraints,
    Frame boundaryRectangle,
    size,
    this.fills,
    strokes,
    strokeWeight,
    strokeAlign,
    styles,
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name: name,
          visible: visible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          style: style,
          layoutAlign: layoutAlign,
          constraints: constraints,
          boundaryRectangle: boundaryRectangle,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'oval';
    log = Logger(runtimeType.toString());
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaEllipse.fromJson(json);
  factory FigmaEllipse.fromJson(Map<String, dynamic> json) =>
      _$FigmaEllipseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaEllipseToJson(this);

  @override
  Future<PBDLNode> interpretNode(PBContext currentContext) async { /*
    imageReference = FigmaAssetProcessor().processImage(UUID);
    return Future.value(
        InheritedBitmap(this, name, currentContext: currentContext)); */
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'oval';

  @override
  DesignNode createDesignNode(Map<String, dynamic> json) {
    // TODO: implement createDesignNode
    throw UnimplementedError();
  }

  @override
  DesignNode fromPBDF(Map<String, dynamic> json) {
    // TODO: implement fromPBDF
    throw UnimplementedError();
  }
}

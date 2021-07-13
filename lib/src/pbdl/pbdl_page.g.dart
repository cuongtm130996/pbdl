// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLPage _$PBDLPageFromJson(Map<String, dynamic> json) {
  return PBDLPage(
    name: json['name'] as String,
    id: json['id'] as String,
    screens: (json['screens'] as List)
        ?.map((e) =>
            e == null ? null : PBDLScreen.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..imageURI = json['imageURI'] as String
    ..convert = json['convert'] as bool
    ..pbdfType = json['pbdfType'] as String
    ..UUID = json['UUID'] as String
    ..boundaryRectangle = json['boundaryRectangle']
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..isVisible = json['isVisible'] as bool
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLPageToJson(PBDLPage instance) => <String, dynamic>{
      'id': instance.id,
      'imageURI': instance.imageURI,
      'name': instance.name,
      'convert': instance.convert,
      'screens': instance.screens,
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'boundaryRectangle': instance.boundaryRectangle,
      'child': instance.child,
      'isVisible': instance.isVisible,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
    };

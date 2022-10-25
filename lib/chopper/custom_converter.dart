import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_extension/logger/logger.dart';

class JsonToSafeTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  const JsonToSafeTypeConverter({required this.typeToJsonFactoryMap});

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
      body: convertToSafeTypeFromJsonData<BodyType, InnerType>(response.body, typeToJsonFactoryMap[InnerType]!),
    );
  }

  T convertToSafeTypeFromJsonData<T, InnerType>(String jsonData, Function parser) {
    var jsonMap = json.decode(jsonData);
    if (jsonMap is List) {
      return jsonMap.map((element) => parser(json.encode(element as Map<String, dynamic>)) as InnerType).toList() as T;
    }
    return parser.call(jsonData);
  }
}

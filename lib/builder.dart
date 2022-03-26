import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:hollyday_land_dao/filter_dao.dart';
import 'package:hollyday_land_dao/full_dao.dart';
import 'package:hollyday_land_dao/list_dao.dart';
import 'package:source_gen/source_gen.dart';

class FilterTagDaoGenerator extends GeneratorForAnnotation<FilterTagDao> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    String className = element.displayName;

    // Flip case of first latter and add "Objects" to the end
    String objectName = className.substring(0, 1).toLowerCase() +
        className.substring(1) +
        "Objects";
    String name = annotation.peek('pluralName')!.stringValue;
    String path = buildStep.inputId.path;

    String filename = path.substring(path.lastIndexOf("/") + 1);

    String result = "part of \"$filename\";\n\n";

    result +=
        "class _${className}Dao extends FilterTagModelAccess<$className> {\n";
    result += "\tconst _${className}Dao();\n\n";

    result += "\t@override\n";
    result +=
        "\t$className fromJson(Map<String, dynamic> json) => $className.fromJson(json);\n";
    result += "\n";

    result += "\t@override\n";
    result += "\tString get modelName => \"$name\";\n";
    result += "}";

    result += "\n\n";

    result +=
        "const FilterTagModelAccess<$className> $objectName = _${className}Dao();\n";

    return result;
  }
}

Builder filterTagDaoBuilder(BuilderOptions options) => LibraryBuilder(
      FilterTagDaoGenerator(),
      generatedExtension: '.objects.filter_tags.dart',
    );

class ListDaoGenerator extends GeneratorForAnnotation<ListDao> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    String className = element.displayName;

    // Flip case of first latter and add "Objects" to the end
    String objectName = className.substring(0, 1).toLowerCase() +
        className.substring(1) +
        "Objects";
    String name = annotation.peek('pluralName')!.stringValue;
    String path = buildStep.inputId.path;

    String filename = path.substring(path.lastIndexOf("/") + 1);

    String result = "part of \"$filename\";\n\n";

    result += "class _${className}Dao extends ShortModelAccess<$className> {\n";
    result += "\tconst _${className}Dao();\n\n";

    result += "\t@override\n";
    result +=
        "\t$className fromJson(Map<String, dynamic> json) => $className.fromJson(json);\n";
    result += "\n";

    result += "\t@override\n";
    result += "\tString get modelName => \"$name\";\n";
    result += "}";

    result += "\n\n";

    result +=
        "const ShortModelAccess<$className> $objectName = _${className}Dao();\n";

    return result;
  }
}

Builder listDaoBuilder(BuilderOptions options) => LibraryBuilder(
      ListDaoGenerator(),
      generatedExtension: '.objects.list.dart',
    );

class FullDaoGenerator extends GeneratorForAnnotation<FullDao> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    String className = element.displayName;

    // Flip case of first latter and add "Objects" to the end
    String objectName = className.substring(0, 1).toLowerCase() +
        className.substring(1) +
        "Objects";
    String pluralName = annotation.peek('pluralName')!.stringValue;
    String? singularName = annotation.peek('singularName')?.stringValue;

    String path = buildStep.inputId.path;

    String filename = path.substring(path.lastIndexOf("/") + 1);

    String result = "part of \"$filename\";\n\n";

    result += "class _${className}Dao extends AttractionModelAccess<$className> {\n";
    result += "\tconst _${className}Dao();\n\n";

    result += "\t@override\n";
    result +=
    "\t$className fromJson(Map<String, dynamic> json) => $className.fromJson(json);\n";
    result += "\n";

    result += "\t@override\n";
    result += "\tString get pluralName => \"$pluralName\";\n";
    result += "\n";

    if(singularName != null) {
      result += "\t@override\n";
      result += "\tString get singularName => \"$singularName\";\n";
    }
    result += "}";

    result += "\n\n";

    result +=
    "const AttractionModelAccess<$className> $objectName = _${className}Dao();\n";

    return result;
  }
}

Builder fullDaoBuilder(BuilderOptions options) => LibraryBuilder(
  FullDaoGenerator(),
  generatedExtension: '.objects.full.dart',
);

# Hollyday Land DAO code generation.

This project performs code generation for the project located at.

`https://github.com/Yana1994ya/Hollyday_Land`

To use this project, specify it as a dependency in a different project by adding it under
`dependencies` in `pubspec.yaml` like so

```yaml
dependencies:
  hollyday_land_dao:
    path: ../hollyday_land_dao
```

And mark the classes you want to add DAO object to with one of the supported DAO tags like so:

```dart
@ListDao("tours")
class TourShort with WithLocation, WithRating, AttractionShort {
  // Code goes here
}
```

than include the generated file (name is different for each Dao type) like so:
for file `short.dart` and the DAO `@ListDao`

```dart
part "short.objects.list.dart";
```

and finally run

`flutter pub run build_runner build --delete-conflicting-outputs`

to perform the actual code generation.
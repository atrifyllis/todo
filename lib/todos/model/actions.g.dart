// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodosLoadedAction _$TodosLoadedActionFromJson(Map<String, dynamic> json) {
  return TodosLoadedAction(
    (json['todos'] as List)
        ?.map(
            (e) => e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TodosLoadedActionToJson(TodosLoadedAction instance) =>
    <String, dynamic>{
      'todos': instance.todos,
    };

TodosNotLoadedAction _$TodosNotLoadedActionFromJson(Map<String, dynamic> json) {
  return TodosNotLoadedAction();
}

Map<String, dynamic> _$TodosNotLoadedActionToJson(
        TodosNotLoadedAction instance) =>
    <String, dynamic>{};

TodoUpdatedAction _$TodoUpdatedActionFromJson(Map<String, dynamic> json) {
  return TodoUpdatedAction(
    json['id'] as String,
    json['done'] as bool,
    json['name'] as String,
  );
}

Map<String, dynamic> _$TodoUpdatedActionToJson(TodoUpdatedAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'done': instance.done,
      'name': instance.name,
    };

TodoOrderChangedAction _$TodoOrderChangedActionFromJson(
    Map<String, dynamic> json) {
  return TodoOrderChangedAction(
    json['id'] as String,
    json['oldIndex'] as int,
    json['newIndex'] as int,
  );
}

Map<String, dynamic> _$TodoOrderChangedActionToJson(
        TodoOrderChangedAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'oldIndex': instance.oldIndex,
      'newIndex': instance.newIndex,
    };

ItemAddedAction _$ItemAddedActionFromJson(Map<String, dynamic> json) {
  return ItemAddedAction(
    json['itemText'] as String,
  );
}

Map<String, dynamic> _$ItemAddedActionToJson(ItemAddedAction instance) =>
    <String, dynamic>{
      'itemText': instance.itemText,
    };

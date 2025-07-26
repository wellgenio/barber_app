// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frequent_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FrequentQuestionModel {

 String get title; List<QuestionModel> get questions;
/// Create a copy of FrequentQuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FrequentQuestionModelCopyWith<FrequentQuestionModel> get copyWith => _$FrequentQuestionModelCopyWithImpl<FrequentQuestionModel>(this as FrequentQuestionModel, _$identity);

  /// Serializes this FrequentQuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FrequentQuestionModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'FrequentQuestionModel(title: $title, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $FrequentQuestionModelCopyWith<$Res>  {
  factory $FrequentQuestionModelCopyWith(FrequentQuestionModel value, $Res Function(FrequentQuestionModel) _then) = _$FrequentQuestionModelCopyWithImpl;
@useResult
$Res call({
 String title, List<QuestionModel> questions
});




}
/// @nodoc
class _$FrequentQuestionModelCopyWithImpl<$Res>
    implements $FrequentQuestionModelCopyWith<$Res> {
  _$FrequentQuestionModelCopyWithImpl(this._self, this._then);

  final FrequentQuestionModel _self;
  final $Res Function(FrequentQuestionModel) _then;

/// Create a copy of FrequentQuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? questions = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FrequentQuestionModel].
extension FrequentQuestionModelPatterns on FrequentQuestionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FrequentQuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FrequentQuestionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FrequentQuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _FrequentQuestionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FrequentQuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _FrequentQuestionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<QuestionModel> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FrequentQuestionModel() when $default != null:
return $default(_that.title,_that.questions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<QuestionModel> questions)  $default,) {final _that = this;
switch (_that) {
case _FrequentQuestionModel():
return $default(_that.title,_that.questions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<QuestionModel> questions)?  $default,) {final _that = this;
switch (_that) {
case _FrequentQuestionModel() when $default != null:
return $default(_that.title,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FrequentQuestionModel implements FrequentQuestionModel {
  const _FrequentQuestionModel({required this.title, required final  List<QuestionModel> questions}): _questions = questions;
  factory _FrequentQuestionModel.fromJson(Map<String, dynamic> json) => _$FrequentQuestionModelFromJson(json);

@override final  String title;
 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of FrequentQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FrequentQuestionModelCopyWith<_FrequentQuestionModel> get copyWith => __$FrequentQuestionModelCopyWithImpl<_FrequentQuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FrequentQuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FrequentQuestionModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'FrequentQuestionModel(title: $title, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$FrequentQuestionModelCopyWith<$Res> implements $FrequentQuestionModelCopyWith<$Res> {
  factory _$FrequentQuestionModelCopyWith(_FrequentQuestionModel value, $Res Function(_FrequentQuestionModel) _then) = __$FrequentQuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String title, List<QuestionModel> questions
});




}
/// @nodoc
class __$FrequentQuestionModelCopyWithImpl<$Res>
    implements _$FrequentQuestionModelCopyWith<$Res> {
  __$FrequentQuestionModelCopyWithImpl(this._self, this._then);

  final _FrequentQuestionModel _self;
  final $Res Function(_FrequentQuestionModel) _then;

/// Create a copy of FrequentQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? questions = null,}) {
  return _then(_FrequentQuestionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}


}

// dart format on

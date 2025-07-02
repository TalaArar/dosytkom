import 'package:dosytkom/features/NewOrder/data/model/educationalField_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalItem_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalLevel_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalSemister_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewOrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

/* ---------- الطلب نفسه ---------- */
class NewOrderInitialState extends NewOrderState {}

class NewOrderLoadingState extends NewOrderState {}

class NewOrderSuccessState extends NewOrderState {
  final String message;
  NewOrderSuccessState(this.message);

  @override
  List<Object?> get props => [message];
}

class NewOrderErrorState extends NewOrderState {
  final String errorMessage;
  NewOrderErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

/* ---------- المواد (Subject) ---------- */
class EducationalItemsLoadingState extends NewOrderState {}

class EducationalItemsLoadedState extends NewOrderState {
  final List<EducationalItem> items;
  EducationalItemsLoadedState(this.items);

  @override
  List<Object?> get props => [items];
}

class EducationalItemsErrorState extends NewOrderState {
  final String message;
  EducationalItemsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

/* ---------- الصفوف (Grade / Level) ---------- */
class EducationalLevelsLoadingState extends NewOrderState {}

class EducationalLevelsLoadedState extends NewOrderState {
  final List<EducationalLevel> levels;
  EducationalLevelsLoadedState(this.levels);

  @override
  List<Object?> get props => [levels];
}

class EducationalLevelsErrorState extends NewOrderState {
  final String message;
  EducationalLevelsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/* ---------- الفروع (Field) ---------- */
class EducationalFieldsLoadingState extends NewOrderState {}

class EducationalFieldsLoadedState extends NewOrderState {
  final List<EducationalField> fields;
  EducationalFieldsLoadedState(this.fields);

  @override
  List<Object?> get props => [fields];
}

class EducationalFieldsErrorState extends NewOrderState {
  final String message;
  EducationalFieldsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
/* ---------- الفصول (Semister) ---------- */
class EducationalSemistersLoadingState extends NewOrderState {}

class EducationalSemistersLoadedState extends NewOrderState {
  final List<EducationalSemister> semisters;
  EducationalSemistersLoadedState(this.semisters);

  @override
  List<Object?> get props => [semisters];
}

class EducationalSemistersErrorState extends NewOrderState {
  final String message;
  EducationalSemistersErrorState(this.message);

  @override
  List<Object?> get props => [message];
}


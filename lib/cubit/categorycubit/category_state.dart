import 'package:eastern_interview/datamodel/category_datamodel.dart';

abstract class CategoryState{}

class CategoryIntilize extends CategoryState{}

class OnLoading extends CategoryState{}

class OnFailed extends CategoryState{
  String errorMsg;

  OnFailed(this.errorMsg);
}

class OnSuccess extends CategoryState{
  CategoryDataModel categoryDataModel;

  OnSuccess(this.categoryDataModel);
}
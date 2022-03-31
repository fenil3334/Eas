import 'package:eastern_interview/datamodel/bottom_datamodel.dart';
import 'package:eastern_interview/datamodel/middle_datamodel.dart';
import 'package:eastern_interview/datamodel/top_datamodel.dart';

abstract class HomeScreenState{}

class HomeScreenIntilize extends HomeScreenState{}

class OnLoading extends HomeScreenState{}

class OnFailed extends HomeScreenState{
  String errorMsg;

  OnFailed(this.errorMsg);
}

class OnSuccessTopMenu extends HomeScreenState{
  TopDataModel categoryDataModel;

  OnSuccessTopMenu(this.categoryDataModel);
}


class OnSuccessMiddleMenu extends HomeScreenState{
  MiddleDataModel middleDataModel;

  OnSuccessMiddleMenu(this.middleDataModel);
}


class OnSuccessBottomMenu extends HomeScreenState{
  BottomDataModel bottomDataModel;

  OnSuccessBottomMenu(this.bottomDataModel);
}
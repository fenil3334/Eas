import 'package:eastern_interview/cubit/home_screen_cubit/home_screen_state.dart';
import 'package:eastern_interview/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenMiddleCubit extends Cubit<HomeScreenState>{
  HomeScreenMiddleCubit() : super(HomeScreenIntilize());

  final ApiService _repository=ApiService();


  Future<void> getMiddleMenu() async {
    try {
      emit(OnLoading());
      final genreMovisLists = await _repository.getMiddleMenu();
      emit(OnSuccessMiddleMenu(genreMovisLists));
    } catch (e) {
      emit(OnFailed(e.toString()));
      rethrow;
    }
  }

}


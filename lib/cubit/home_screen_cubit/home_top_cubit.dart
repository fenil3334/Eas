import 'package:eastern_interview/cubit/home_screen_cubit/home_screen_state.dart';
import 'package:eastern_interview/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState>{
  HomeScreenCubit() : super(HomeScreenIntilize());

  final ApiService _repository=ApiService();


  Future<void> getTopMenu() async {
    try {
      emit(OnLoading());
      final genreMovisLists = await _repository.getTopMenu();
      emit(OnSuccessTopMenu(genreMovisLists));
    } catch (e) {
      emit(OnFailed(e.toString()));
      rethrow;
    }
  }
}


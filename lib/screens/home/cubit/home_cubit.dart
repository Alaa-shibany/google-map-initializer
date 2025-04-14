import 'package:bloc/bloc.dart';
import 'package:google_map_initializer/models/project_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}

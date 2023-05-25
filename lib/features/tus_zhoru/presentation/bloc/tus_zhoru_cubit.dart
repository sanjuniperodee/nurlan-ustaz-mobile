import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_state.dart';


@injectable
class TusZhoruCubit extends Cubit<TusZhoruState> {
  TusZhoruCubit(super.initialState);
}

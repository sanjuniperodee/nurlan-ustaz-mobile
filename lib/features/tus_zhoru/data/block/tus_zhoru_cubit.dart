import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
<<<<<<<< HEAD:lib/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart

import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_state.dart';
========
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/block/tus_zhoru_state.dart';
>>>>>>>> 9921bc5 (add profile main,info,payments page):lib/features/tus_zhoru/data/block/tus_zhoru_cubit.dart

@injectable
class TusZhoruCubit extends Cubit<TusZhoruState> {
  TusZhoruCubit(super.initialState);
}

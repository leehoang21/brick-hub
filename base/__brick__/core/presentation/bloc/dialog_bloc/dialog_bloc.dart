import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eglife_ecommerce/common/extension/translate_extension.dart';
import 'package:injectable/injectable.dart';
part 'dialog_state.dart';
part 'snackbar_type.dart';

@lazySingleton
class DialogBloc extends Cubit<DialogState> {
  DialogBloc() : super(InitialDialogState());

  Future<void> showSnackbar({
    required String translationKey,
    SnackBarType type = SnackBarType.error,
    List<dynamic>? params,
    Key? key,
  }) async {
    emit(
      ShowSnackBarState(
        translationKey: translationKey.tr,
        type: type,
        params: params ?? [],
        key: key,
      ),
    );
  }

  Future<void> showDialog({
    required Widget child,
    Key? key,
  }) async {
    emit(
      ShowDialogState(
        child: child,
        key: key,
      ),
    );
  }
}

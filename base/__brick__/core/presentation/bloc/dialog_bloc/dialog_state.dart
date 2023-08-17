part of 'dialog_bloc.dart';

abstract class DialogState {}

class InitialDialogState extends DialogState {}

class ShowDialogState extends DialogState {
  final Widget child;
  final Key? key;

  ShowDialogState({
    required this.child,
    this.key,
  });
}

class ShowSnackBarState extends DialogState {
  final String? translationKey;
  final List? params;
  final SnackBarType? type;
  final Key? key;
  ShowSnackBarState({
    this.translationKey,
    this.params,
    this.type,
    this.key,
  });
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_eglife_ecommerce/core/presentation/widgets/dialog/flash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/constants/icon_constants.dart';
import '../../../../themes/themes.dart';
import '../../bloc/dialog_bloc/dialog_bloc.dart';
import 'constants.dart';

typedef TopSnackBarStatusCallBack = void Function(TopSnackBarStatus status);

// ignore: must_be_immutable
class TopSnackBar<T extends Object> extends StatefulWidget {
  final BuildContext? context;
  final String? title;
  final SnackBarType type;
  TopSnackBarStatusCallBack? onStatusChanged;

  TopSnackBar({
    Key? key,
    this.context,
    this.title,
    this.type = SnackBarType.error,
  }) : super(key: key) {
    onStatusChanged = onStatusChanged;
  }

  Duration duration = const Duration(milliseconds: 1000);

  Future<void> show(
    BuildContext context, {
    Future<bool> Function()? onWillPop,
  }) async {
    showFlash(
      context: context,
      duration: duration,
      onWillPop: () async {
        if (onWillPop != null) {
          return await onWillPop();
        }
        return true;
      },
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          barrierDismissible: true,
          behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          child: this,
        );
      },
    );
  }

  @override
  State createState() {
    return _TopDialogState<T>();
  }
}

class _TopDialogState<K extends Object> extends State<TopSnackBar>
    with TickerProviderStateMixin {
  FocusScopeNode? _focusScopeNode;
  FocusAttachment? _focusAttachment;

  TopSnackBarStatus? currentStatus;

  GlobalKey backgroundBoxKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _focusScopeNode = FocusScopeNode();
    _focusAttachment = _focusScopeNode?.attach(context);
  }

  @override
  void dispose() {
    _focusScopeNode?.dispose();
    _focusAttachment?.detach();
    super.dispose();
  }

  Widget _buildIcon() {
    if (widget.type == SnackBarType.success) {
      return Container(
        key: const Key('success_container_icon_key'),
        child: SvgPicture.asset(
          IconConstants.successIcon,
          width: 32,
          height: 32,
        ),
      );
    } else {
      return Container(
        key: const Key('close_container_icon_key'),
        child: SvgPicture.asset(
          IconConstants.snackBarFailedIcon,
          width: 32,
          height: 32,
        ),
      );
    }
  }

  Widget _buildTitleText() {
    return Text(
      widget.title ?? '',
      softWrap: true,
      key: const ValueKey('snackbar_title_key'),
      style: Theme.of(context).snackBarTheme.contentTextStyle,
    );
  }

  List<Widget> _buildRowLayout() {
    return <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 41.0),
        child: _buildIcon(),
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
          child: _buildTitleText(),
        ),
      ),
    ];
  }

  BoxDecoration boxDecoration = BoxDecoration(
    color: AppColor.white,
    borderRadius: BorderRadius.circular(25.0),
    boxShadow: const [
      BoxShadow(
        color: AppColor.grey,
        blurRadius: 10.0,
        offset: Offset(0.5, 0.5),
      )
    ],
  );

  Widget _buildSnackBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      key: backgroundBoxKey,
      decoration: boxDecoration,
      child: Row(
        children: _buildRowLayout(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 64.0),
      child: Material(type: MaterialType.transparency, child: _buildSnackBar()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';

@immutable
abstract base class BaseScreen<
  B extends StateStreamableSource<S>,
  S extends BaseState
>
    extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget child = BlocConsumer<B, S>(
      listener: onStateChanged,
      builder: (context, state) {
        return Container(
          color: unSafeAreaColor,
          child:
              wrapWithSafeArea
                  ? SafeArea(
                    top: setTopSafeArea,
                    bottom: setBottomSafeArea,
                    child: _buildScaffold(context, state),
                  )
                  : _buildScaffold(context, state),
        );
      },
    );

    B? bloc = context.read<B?>();

    if (createNewBlocInstance || bloc == null) {
      return BlocProvider<B>(
        create: (_) {
          final B bloc = GetIt.I<B>();
          onBlocCreated(bloc);
          return bloc;
        },
        child: child,
      );
    }

    return BlocProvider.value(value: bloc, child: child);
  }

  Widget _buildScaffold(BuildContext context, S state) {
    return Scaffold(
      extendBody: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: buildStateScreen(context, state),
      backgroundColor: screenBackgroundColor,
      bottomNavigationBar: buildBottomNavigationBar(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: buildFloatingActionButton,
    );
  }

  @protected
  Widget buildStateScreen(BuildContext context, S state) {
    switch (state.stateType) {
      case BaseStateType.initial:
        return const SizedBox.shrink();
      case BaseStateType.inProgress:
        return const Center(child: CircularProgressIndicator());
      case BaseStateType.failure:
        if (showErrorPage) {
          return Center(
            child: Text(state.errorMessage ?? StringConst.defaultErrorMessage),
          );
        }
        return buildScreen(context, state);
      default:
        return buildScreen(context, state);
    }
  }

  @protected
  Color? get unSafeAreaColor => Colors.black;

  @protected
  bool get resizeToAvoidBottomInset => true;

  @protected
  Widget? get buildFloatingActionButton => null;

  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @protected
  bool get extendBodyBehindAppBar => false;

  @protected
  Color? get screenBackgroundColor => Colors.white;

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget buildScreen(BuildContext context, S state);

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  bool get wrapWithSafeArea => false;

  @protected
  bool get setBottomSafeArea => true;

  @protected
  bool get setTopSafeArea => true;

  @protected
  bool get showErrorPage => true;

  @protected
  bool get createNewBlocInstance => true;

  @protected
  void onBlocCreated(B bloc) {}

  @protected
  void onStateChanged(BuildContext context, S state) {}
}

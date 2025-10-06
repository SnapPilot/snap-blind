part of '../login_screen.dart';

final class _AgreementBottomSheet extends BaseScreen<AuthBloc, AuthState> {
  const _AgreementBottomSheet();

  @override
  Color? get screenBackgroundColor => Colors.transparent;

  @override
  Color? get unSafeAreaColor => Colors.transparent;

  @override
  bool get showErrorPage => false;

  Future<void> show(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      constraints: BoxConstraints(maxHeight: size.height * 0.6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (ctx) {
        return this;
      },
    );
  }

  @override
  Widget buildScreen(BuildContext context, AuthState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 58,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.cGray200,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.cGray200),
              borderRadius: BorderRadius.circular(4),
            ),
            child: RadioButton(
              initialValue: false,
              onChanged: (value) {},
              label: '약관에 모두 동의',
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

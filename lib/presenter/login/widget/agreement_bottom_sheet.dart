part of '../login_screen.dart';

final class _AgreementBottomSheet extends StatefulWidget {
  const _AgreementBottomSheet();

  Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return this;
      },
    );
  }

  @override
  State<_AgreementBottomSheet> createState() => _AgreementBottomSheetState();
}

final class _AgreementBottomSheetState extends State<_AgreementBottomSheet> {
  bool _agreeAll = false;
  bool _agreeTerms = false;
  bool _agreePrivacy = false;
  bool _agreeAge14 = false;

  void _syncAllFromItems() {
    setState(() {
      _agreeAll = _agreeTerms && _agreePrivacy && _agreeAge14;
    });
  }

  void _setAll(bool value) {
    setState(() {
      _agreeAll = value;
      _agreeTerms = value;
      _agreePrivacy = value;
      _agreeAge14 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              value: _agreeAll,
              initialValue: _agreeAll,
              onChanged: (value) => _setAll(value),
              label: StringConst.agreeAll,
            ),
          ),
          const SizedBox(height: 14),
          CheckListTile(
            label: StringConst.termsOfService,
            value: _agreeTerms,
            onChanged: (value) {
              _agreeTerms = value;
              _syncAllFromItems();
            },
            onTap: () {
              PlatformUtils.launch(
                Uri.parse(
                  'https://sunny-fireman-0b1.notion.site/Famila-Terms-of-Service-288b7d9285398028bc35e60fe73a7f59',
                ),
              );
            },
          ),
          CheckListTile(
            label: StringConst.privacyPolicy,
            value: _agreePrivacy,
            onChanged: (value) {
              _agreePrivacy = value;
              _syncAllFromItems();
            },
            onTap: () {
              PlatformUtils.launch(
                Uri.parse(
                  'https://sunny-fireman-0b1.notion.site/Famila-Privacy-Policy-288b7d92853980fcbe17c141c0453a7b?source=copy_link',
                ),
              );
            },
          ),
          CheckListTile(
            label: StringConst.ageOver14,
            value: _agreeAge14,
            showTrailing: false,
            onChanged: (value) {
              _agreeAge14 = value;
              _syncAllFromItems();
            },
          ),
          const SizedBox(height: 8),
          AppButton(
            buttonText: StringConst.startButton,
            backgroundColor: AppColors.primary.withValues(
              alpha: _agreeAll ? 1 : 0.5,
            ),
            onTap: () {
              final AuthBloc bloc = context.read<AuthBloc>();
              bloc.add(const UpdateAllAgreementEvent());
            },
          ),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }
}

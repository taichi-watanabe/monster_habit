import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

class GetErrorContainer extends HookConsumerWidget {
  const GetErrorContainer({Key? key, this.onTapRetry}) : super(key: key);

  final Function()? onTapRetry;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _defaultErrorPage(),
          AppButton(
            text: '再度読み込み',
            fontSize: 16,
            backgroundColor: AppColor.blueTextColor,
            width: 220,
            onPressed: () {
              if (onTapRetry != null) onTapRetry!();
            },
          )
        ],
      ),
    );
  }

  Widget handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 403:
        return _maintenanceErrorPage();
      default:
        return _defaultErrorPage();
    }
  }

  Widget _defaultErrorPage() {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            'images/svg/maintenance.svg',
            width: 220,
          ),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: AppText(
            text: '通信エラーが発生しました。\n\nネットワーク状況を確認後、再度読み込みボタンをタップして下さい。',
            fontSize: 15,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _maintenanceErrorPage() {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            'images/svg/maintenance.svg',
            width: 220,
          ),
        ),
        const SizedBox(height: 24),
        const AppText(
          text: 'メンテナンス中です',
          fontSize: 17,
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}

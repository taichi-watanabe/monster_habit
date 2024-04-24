import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:monster_habit/state/users.dart';
import 'package:monster_habit/ui/error/get_error_container.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

@RoutePage()
class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(accessTokenProvider).when(
          data: ((uuid) {
            if (uuid!.isEmpty) {
              return const UserRegisterPage();
            } else {
              return _body(context, ref, uuid);
            }
          }),
          error: (error, stacktrace) {
            return Text(error.toString());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }

  Widget _body(BuildContext context, WidgetRef ref, String uuid) {
    return Scaffold(
        backgroundColor: AppColor.backGroundLight,
        appBar: AppBar(
          title: const AppText(
            text: "アカウント",
            color: AppColor.mainTextColor,
            fontSize: 20,
          ),
          backgroundColor: AppColor.appMainColor,
        ),
        body: ref.watch(fetchUserProvider(uuid)).when(
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (error, stacktrace) => GetErrorContainer(
                  onTapRetry: () => ref.invalidate(fetchUserProvider(uuid)),
                ),
            data: (data) {
              if (data == null) {
                return const SizedBox();
              }
              return WillPopScope(
                onWillPop: () async => false,
                child: RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(fetchUserProvider(uuid));
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: data.userName,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    AppText(
                                      text: data.userJob,
                                      fontSize: 12,
                                    )
                                  ],
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      fixedSize: const Size(70, 70),
                                      shape: const CircleBorder(),
                                    ),
                                    onPressed: () {},
                                    child: data.userImageUrl == ''
                                        ? Image.asset('images/Halloween-24.png')
                                        : Image.asset(
                                            data.userImageUrl!,
                                            fit: BoxFit.fill,
                                          )),
                              ],
                            ),
                          ),
                          //基本情報
                          _listSectionHeader('基本情報'),
                          _listColumn(_infomationList(), ref: ref),
                          _listSectionHeader('サポート'),
                          _listColumn(_supportList(context, ref), ref: ref)
                        ],
                      ),
                    )),
              );
            }));
  }

  Widget _listSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
      child: AppText(
        text: title,
        fontSize: 12,
        color: AppColor.textLight,
      ),
    );
  }

  Widget _listColumn(
    List<_AccountListItem> item, {
    bool useBottomMargin = false,
    required WidgetRef ref,
  }) {
    return Container(
      margin:
          useBottomMargin ? const EdgeInsets.only(bottom: 27) : EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: AppColor.backGround,
        border: Border(
          top: BorderSide(
            color: AppColor.borderMiddle,
          ),
          bottom: BorderSide(color: AppColor.borderMiddle),
        ),
      ),
      child: Column(
        children: List.generate(
          item.length,
          (index) => InkWell(
            onTap: () async {
              var _item = item[index];

              final onTapCallBack = item[index].onTapCallBack;
              final url = item[index].urlPath;

              if (onTapCallBack != null) {
                onTapCallBack();
              } else {
                /*if (url != null) {
                  // if (_item.isExternalUrl) {
                  //   return await launchUrl(url,
                  //       mode: LaunchMode.externalApplication);
                  // }

                  if (url.contains(Strings.internalUrl)) {
                    // 利回りくんのページはWebViewで遷移
                    router.push(WebviewRoute(
                        title: item[index].title,
                        appUrl: url,
                        needLogin:
                            (item[index].requiredUserStatus?.index ?? 0) > 0));
                  } else if (url == '') {
                    return;
                  } else {
                    // それ以外は外部ブラウザ起動
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                }*/
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: SvgPicture.asset(
                    'images/svg/${item[index].icon}',
                    color: AppColor.statusColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: index != item.length - 1
                          ? const Border(
                              bottom: BorderSide(color: AppColor.borderMiddle),
                            )
                          : null,
                    ),
                    height: 56,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppText(
                            text: item[index].title,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child:
                              SvgPicture.asset('images/svg/arrow-forward.svg'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 基本情報
  List<_AccountListItem> _infomationList() => [
        _AccountListItem(
            title: 'Monster Habitについて',
            icon: 'icon_note.svg',
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'アプリの使い方',
            icon: 'icon_investorInformation.svg',
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'レビューで応援する', icon: 'event.svg', onTapCallBack: () => null),
      ];

  // サポート
  List<_AccountListItem> _supportList(BuildContext context, WidgetRef ref) => [
        _AccountListItem(
            title: 'お問い合わせ（チャット）',
            icon: 'icon_information.svg',
            onTapCallBack: () => context.router.push(const ChatRoute())),
        _AccountListItem(
            title: 'お問い合わせ（メール）',
            icon: 'icon_mail.svg',
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'プライバシーポリシー',
            icon: 'icon_privacy.svg',
            onTapCallBack: () => null),
        _AccountListItem(
            title: 'バージョンアップ情報',
            icon: 'icon_version.svg',
            onTapCallBack: () => null),
      ];
}

class _AccountListItem {
  _AccountListItem({
    required this.title,
    required this.icon,
    this.onTapCallBack,
    this.urlPath,
  });
  final String title;
  final String icon;
  final VoidCallback? onTapCallBack;
  final String? urlPath;
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/users/user_register_page_notifier.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

@RoutePage()
class UserRegisterPage extends HookConsumerWidget {
  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.appMainColor,
      body: getBody(context, ref),
    );
  }

  Widget getBody(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(userRegisterNotifierProvider.notifier);

    return SafeArea(
        child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "ニックネーム",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.mainTextColor,
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        notifier.setUserName(value);
                      },
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.people_alt),
                          prefixIconColor: Colors.black,
                          hintText: "ユーザー名",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "職業",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.mainTextColor,
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        notifier.setType(value);
                      },
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.badge),
                          prefixIconColor: Colors.black,
                          hintText: "ほのぼの会社員",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              notifier.saveUser();
              context.router.replace(const DashboardRoute());
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: AppColor.blueTextColor,
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: AppText(
                  text: "冒険を始める",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

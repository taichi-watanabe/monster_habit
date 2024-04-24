import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monster_habit/repository/preferences/preferences_repository.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stamina_notifier.freezed.dart';
part 'stamina_notifier.g.dart';

@riverpod
class StaminaNotifier extends _$StaminaNotifier with WidgetsBindingObserver {
  @override
  StaminaItems build() {
    WidgetsBinding.instance.addObserver(this);
    setupTimeZone();
    return StaminaItems(time: DateTime.utc(0, 0, 0).add(Duration(seconds: 30)));
  }

  Future<void> setupTimeZone() async {
    tz.initializeTimeZones();
    var tokyo = tz.getLocation('Asia/Tokyo');
    tz.setLocalLocation(tokyo);
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      // バックグラウンドに遷移した時
      handleOnPaused;
    } else if (state == AppLifecycleState.resumed) {
      // フォアグラウンドに復帰した時
      handleOnResumed;
    } else if (state == AppLifecycleState.detached) {
      handleOnDetached();
    }
  }

  /// アプリがバックグラウンドに遷移した際のハンドラ
  void handleOnPaused() {
    if (state.timer!.isActive) {
      state = state.copyWith(isTimerPaused: true);
      state.timer!.cancel(); // タイマーを停止する
    }
    state = state.copyWith(pausedTime: DateTime.now()); // バックグラウンドに遷移した時間を記録
  }

  //アプリが破棄された時のハンドラ
  Future<void> handleOnDetached() async {
    if (state.timer!.isActive) {
      state.timer!.cancel(); // タイマーを停止する
    }
    await ref
        .watch(preferencesRepositoryProvider)
        .saveTime(DateTime.now().toString()); //detachedした時間を記録
  }

  /// アプリがフォアグラウンドに復帰した際のハンドラ
  Future<void> handleOnResumed() async {
    final detachedTime =
        await ref.watch(preferencesRepositoryProvider).loadTime();
    if (!state.isTimerPaused || detachedTime!.isEmpty) {
      return; // タイマーが動いてなければ何もしない
    } else if (state.isTimerPaused || detachedTime.isEmpty) {
      Duration backgroundDuration =
          DateTime.now().difference(state.pausedTime!); // バックグラウンドでの経過時間
      if (state.time!
              .difference(DateTime.utc(0, 0, 0))
              .compareTo(backgroundDuration) <
          0) {
        state = state.copyWith(time: DateTime.utc(0, 0, 0)); // 時間をリセットする
      } else {
        state = state.copyWith(
            time: state.time!.add(-backgroundDuration)); // バックグラウンド経過時間分時間を進める
        startTimer(); // タイマーを再開する
      }
    } else if (detachedTime.isNotEmpty) {
      Duration backgroundDuration = DateTime.now()
          .difference(DateTime.parse(detachedTime)); // バックグラウンドでの経過時間
      if (state.time!
              .difference(DateTime.utc(0, 0, 0))
              .compareTo(backgroundDuration) <
          0) {
        state = state.copyWith(time: DateTime.utc(0, 0, 0)); // 時間をリセットする
      } else {
        state = state.copyWith(
            time: state.time!.add(-backgroundDuration)); // バックグラウンド経過時間分時間を進める
        startTimer(); // タイマーを再開する
        ref.watch(preferencesRepositoryProvider).clearTime();
      }
    }
  }

  // タイマーを開始する
  void startTimer() {
    if (state.currentStamina == 0) {
      print('スタミナなし');
      return; // スタミナが0の場合は処理を終了させる
    } else if (state.currentStamina == 3) {
      state = state.copyWith(currentStamina: state.currentStamina - 1);
      final newTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        state = state.copyWith(
          time: state.time!.add(Duration(seconds: -1)),
        );
        handleTimeIsOver();
      });
      state = state.copyWith(timer: newTimer);
    } else if (state.currentStamina == 2 || state.currentStamina == 1) {
      state = state.copyWith(currentStamina: state.currentStamina - 1);
      state = state.copyWith(
          time: DateTime.utc(0, 0, 0).add(Duration(seconds: 30)));
      if (state.timer != null &&
          state.timer!.isActive &&
          state.time != null &&
          state.time == DateTime.utc(0, 0, 0)) {
        state = state.copyWith(
            currentStamina: state.currentStamina + 1,
            time: DateTime.utc(0, 0, 0).add(Duration(seconds: 30)));
      }
    }
  }

  // 時間がゼロになったらタイマーを止める
  void handleTimeIsOver() {
    if (state.currentStamina == 2) {
      if (state.timer != null &&
          state.timer!.isActive &&
          state.time != null &&
          state.time == DateTime.utc(0, 0, 0)) {
        state.timer!.cancel();
        state = state.copyWith(
            currentStamina: state.currentStamina + 1,
            time: DateTime.utc(0, 0, 0).add(Duration(seconds: 30)));
      }
    } else if (state.currentStamina == 1 || state.currentStamina == 0) {
      if (state.timer != null &&
          state.timer!.isActive &&
          state.time != null &&
          state.time == DateTime.utc(0, 0, 0)) {
        state = state.copyWith(
            currentStamina: state.currentStamina + 1,
            time: DateTime.utc(0, 0, 0).add(Duration(seconds: 30)));
      }
    }
  }
}

@freezed
class StaminaItems with _$StaminaItems {
  factory StaminaItems({
    @Default(3) int currentStamina,
    @Default(false) bool isTimerPaused,
    DateTime? time,
    DateTime? pausedTime,
    Timer? timer,
  }) = _StaminaItems;
}

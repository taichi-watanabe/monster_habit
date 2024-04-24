import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';

class AppForm extends ConsumerWidget {
  AppForm(
      {super.key,
      this.hintText,
      this.onChanged,
      this.validationCallBack,
      this.textInputType = TextInputType.text,
      this.controller,
      this.focusNode,
      this.fieldKey,
      this.digitsOnly = false,
      this.useHelperText = false,
      this.bottomScrollPadding = 20,
      this.initialValue,
      this.readOnly = false,
      this.autocorrect = true,
      this.fillColor,
      this.vercial,
      this.maxLength,
      this.maxLines,
      this.icon,
      this.enabled});

  final String? hintText;
  final Function? validationCallBack;
  Function(String)? onChanged;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GlobalKey<FormFieldState<dynamic>>? fieldKey;
  final bool digitsOnly;
  final bool useHelperText;
  final double bottomScrollPadding;
  final String? initialValue;
  final bool readOnly;
  final bool autocorrect;
  final Color? fillColor;
  final double? vercial;
  final icon;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      autocorrect: autocorrect,
      scrollPadding: EdgeInsets.only(bottom: bottomScrollPadding),
      key: fieldKey,
      enabled: enabled,
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: (value) =>
          validationCallBack != null ? validationCallBack!(value) : null,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.bottom,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          fillColor: fillColor,
          suffixIcon: icon,
          filled: true,
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColor.greyText),
          helperText: useHelperText ? ' ' : null,
          errorMaxLines: 2,
          contentPadding: vercial == null
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
              : EdgeInsets.symmetric(horizontal: 12, vertical: vercial!)),
      controller: controller,
      initialValue: initialValue,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      maxLines: maxLines,
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sarraf/core/theming/style.dart';

class LanguageOption extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final String title;
  final String subtitle;
  final String code;
  final bool value;
  const LanguageOption({
    super.key,
    this.onChanged,
    required this.title,
    required this.subtitle,
    required this.code,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(code, style: TextStyles.font15TextPrimarySemiBold(context)),
      ),
      title: Text(title.tr()),
      subtitle: Text(subtitle.tr()),
      trailing: Transform.scale(
        scale: 1.3,
        child: Checkbox(
          shape: const CircleBorder(),
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ClickAbleStoreCopyRight extends StatelessWidget {
  const ClickAbleStoreCopyRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
              child: Text(
            'storeCopyright',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(height: 1.0, letterSpacing: 1.0),
          )),
          const WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: SizedBox(width: 8)),
          TextSpan(
            text: 'appLocalizations.labelDataPrivacy',
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrlString('ThemeConfig.dataPrivacyLink'),
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(height: 1.0, letterSpacing: 1.0),
          ),
          const WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: SizedBox(width: 8)),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrlString('ThemeConfig.impressumLink'),
            text: 'appLocalizations.labelImprint',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(height: 1.0, letterSpacing: 1.0),
          ),
          const WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: SizedBox(width: 8)),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrlString('ThemeConfig.agbLink'),
            text: 'appLocalizations.labelGeneralInfo',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(height: 1.0, letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }
}

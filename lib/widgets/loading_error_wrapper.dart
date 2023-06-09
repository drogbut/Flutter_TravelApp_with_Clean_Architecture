import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_app/commons/business_exception.dart';
import 'package:travel_app/widgets/sd_cards/sd_notification.dart';

class LoadingErrorWrapper extends StatelessWidget {
  final ValueGetter<bool> isLoading;
  final ValueGetter<BusinessException?> error;
  final Widget? child;

  final Key? loadingKey;

  const LoadingErrorWrapper({
    Key? key,
    required this.isLoading,
    required this.error,
    this.child,
    this.loadingKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Observer(
            builder: (_) => isLoading()
                ? LinearProgressIndicator(key: loadingKey)
                : const SizedBox.shrink(),
          ),
          Observer(builder: (context) {
            final BusinessException? exception = error.call();

            if (exception == null) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SdNotification(
                body: exception.localizedMessage(context),
                notificationType: NotificationType.error,
              ),
            );
          }),
          if (child != null) child!,
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:travel_app/widgets/apps/sd_wrapper/sd_card_wrapper_widget.dart';
import 'package:travel_app/widgets/text_field_observer_builder.dart';

class SdCommentBox extends StatelessWidget {
  final String? text;
  final void Function(String)? onChanged;

  const SdCommentBox({this.text, this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SdCardWrapperWidget(
      child: SizedBox(
        height: 128.0,
        child: TextFieldObserverBuilder(
          getText: () => text,
          builder: (_, controller) => TextFormField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'labelEnterComment',
              ),
              onChanged: (value) => onChanged?.call(value)),
        ),
      ),
    );
  }
}

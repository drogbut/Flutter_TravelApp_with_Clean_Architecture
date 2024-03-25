import 'package:flutter/material.dart';
import 'package:travel_app/ui/tv_pickers/providers/genral_tab_controller.dart';
import 'package:travel_app/ui/tv_pickers/widgets/picker_icon.dart';

class TvDateRangeContainer extends StatelessWidget {
  final GeneralTabController generalTabController;
  const TvDateRangeContainer({
    required this.generalTabController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TvPickerIcon(onPressed: () {}, iconData: Icons.arrow_back_ios),
            TextButton(
              onPressed: () =>
                  generalTabController.selectRangeDate(context: context),
              child: ValueListenableBuilder(
                valueListenable: generalTabController.fromDateNotifier,
                builder: (context, fromDate, toDate) {
                  return Text(generalTabController.formatDate(fromDate));
                },
              ),
            ),
            TvPickerIcon(onPressed: () {}, iconData: Icons.arrow_forward_ios),
          ],
        ),
        const SizedBox(width: 15),
        Row(
          children: [
            TvPickerIcon(onPressed: () {}, iconData: Icons.arrow_back_ios),
            TextButton(
              onPressed: () =>
                  generalTabController.selectRangeDate(context: context),
              child: ValueListenableBuilder(
                valueListenable: generalTabController.toDateNotifier,
                builder: (context, fromDate, toDate) {
                  return Text(generalTabController.formatDate(fromDate));
                },
              ),
            ),
            TvPickerIcon(onPressed: () {}, iconData: Icons.arrow_forward_ios),
          ],
        ),
      ],
    );
  }
}

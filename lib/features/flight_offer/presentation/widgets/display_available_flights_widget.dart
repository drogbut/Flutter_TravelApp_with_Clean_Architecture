import 'package:flutter/material.dart';

import '../../../../core/colors/my_colors.dart';
import '../../../../core/constants/my_constant.dart';
import '../../data/models/flight_offer/flight_offer.dart';

class DisplayAvailableFlightsWidget extends StatelessWidget {
  final FlightOffer flightOffer;

  const DisplayAvailableFlightsWidget({
    super.key,
    required this.flightOffer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: MyConstants.paddingLarge),
        Row(
          children: [
            Expanded(
                child: Text(
              "${flightOffer.itineraries?.length.toString()} Flights",
              style: const TextStyle(color: MyColors.background),
            )),
            ElevatedButton(onPressed: () {}, child: const Text('Filter')),
            ElevatedButton(onPressed: () {}, child: const Text('Sort')),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_important)),
          ],
        ),
        const SizedBox(height: MyConstants.paddingMedium),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: flightOffer.itineraries!.length,
            itemBuilder: (ctx, index) {
              return const Placeholder(fallbackHeight: 150);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: MyConstants.paddingLarge,
                color: MyColors.onBackground,
              );
            },
          ),
        ),
      ],
    );
  }
}

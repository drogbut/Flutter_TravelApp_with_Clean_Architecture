import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors/my_colors.dart';
import 'package:travel_app/features/flight_offer/presentation/bloc/flight_offers_bloc.dart';
import 'package:travel_app/features/flight_offer/presentation/widgets/loading_widget.dart';

import '../../../../core/constants/my_constant.dart';
import '../../../../core/global_widgets/travel_appbar.dart';
import '../../../../injection_container.dart';
import '../widgets/display_available_flights_widget.dart';
import 'input_search_data_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, MyConstants.toolbarHeight),
          child: TravelAppbar()),
      body: BlocProvider(
        create: (_) => sl<FlightOffersBloc>(),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MyConstants.paddingLarge),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputSearchDataCard(),
                DisplayAvailableFlights(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DisplayAvailableFlights extends StatelessWidget {
  const DisplayAvailableFlights({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightOffersBloc, FlightOffersState>(
      builder: (context, state) {
        if (state is Error) {
          return Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Text(state.message.toString(),
                  style: const TextStyle(color: MyColors.error)),
            ),
          );
        }
        if (state is Empty) {
          return const Padding(
            padding: EdgeInsets.only(top: 80.0),
            child: Center(
              child: Text('Search results will be displayed here!',
                  style: TextStyle(color: MyColors.background)),
            ),
          );
        }
        if (state is Loading) {
          return const LoadingWidget();
        }
        if (state is Loaded) {
          return DisplayAvailableFlightsWidget(flightOffer: state.flightOffer);
        }
        return const Padding(
          padding: EdgeInsets.only(top: 80.0),
          child: Center(
            child: Text('Something Wrong',
                style: TextStyle(color: MyColors.error)),
          ),
        );
      },
    );
  }
}

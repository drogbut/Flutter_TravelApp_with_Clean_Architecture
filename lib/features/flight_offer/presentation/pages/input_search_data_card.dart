import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/colors/my_colors.dart';
import '../../../../core/constants/my_constant.dart';
import '../../../../core/params/usecase.dart';
import '../bloc/flight_offers_bloc.dart';

class InputSearchDataCard extends StatefulWidget {
  const InputSearchDataCard({super.key});

  @override
  State<InputSearchDataCard> createState() => _InputSearchDataCardState();
}

class _InputSearchDataCardState extends State<InputSearchDataCard> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  late String inputFrom = '';
  late String inputTo = '';

  int selectedNumber = 1;
  final _formKey = GlobalKey<FormState>();
  final FocusNode secondFocusNode = FocusNode();
  final FocusNode thirdFocusNode = FocusNode();

  late DateTime _departureDate = DateTime.now();
  late DateTime _returnDate = DateTime(2030);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Flights',
              style:
                  textTheme.titleMedium?.copyWith(color: MyColors.background)),
          const SizedBox(height: MyConstants.paddingLarge),
          TextFormField(
            controller: fromController,
            decoration: customDecoration(
                prefixIconData: Icons.circle_outlined,
                hintText: 'Departure - Enter an IATA code',
                topRight: MyConstants.borderRadiusMedium,
                topLeft: MyConstants.borderRadiusMedium),
            onChanged: (value) {
              inputFrom = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(secondFocusNode);
            },
          ),
          TextFormField(
            controller: toController,
            focusNode: secondFocusNode,
            decoration: customDecoration(
              prefixIconData: Icons.local_airport,
              hintText: 'Arrival - Enter an IATA code',
            ),
            onChanged: (value) {
              inputTo = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(thirdFocusNode);
            },
          ),
          InputDecorator(
            decoration: customDecoration(
                prefixIconData: Icons.person_outline_rounded,
                hintText: 'Number of passengers: $selectedNumber'),
            child: DropdownButton<int>(
              icon: const SizedBox.shrink(),
              underline: const SizedBox.shrink(),
              elevation: 0,
              isDense: true,
              value: selectedNumber,
              focusNode: thirdFocusNode,
              borderRadius:
                  BorderRadius.circular(MyConstants.borderRadiusMedium),
              items: List.generate(9, (index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text("Number of passengers = ${index + 1}"),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedNumber = value!;
                });
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _selectDate(context, true),
                  child: InputDecorator(
                    decoration: customDecoration(
                        prefixIconData: Icons.calendar_month_outlined,
                        hintText: 'Departure Date',
                        bottomLeft: MyConstants.borderRadiusMedium),
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(_departureDate),
                    ),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: InkWell(
                  onTap: () => _selectDate(context, false),
                  child: InputDecorator(
                    decoration: customDecoration(
                        prefixIconData: Icons.calendar_month_outlined,
                        hintText: 'Return Date',
                        bottomRight: MyConstants.borderRadiusMedium),
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(_departureDate),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: MyConstants.paddingLarge),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(MyConstants.borderRadiusMedium))),
            child: Text(
              'Search',
              style: textTheme.titleLarge?.copyWith(color: MyColors.background),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                dispatchFlightOffers(context);
              }
            },
          ),
        ],
      ),
    );
  }

  InputDecoration customDecoration({
    required String hintText,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    required IconData prefixIconData,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: MyColors.background,
      hintText: hintText,
      prefixIcon: Icon(prefixIconData),
      border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
          )),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isDepartureDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDepartureDate ? _departureDate : _returnDate,
      firstDate: _departureDate,
      lastDate: _returnDate,
    );

    if (picked != null &&
        picked != (isDepartureDate ? _departureDate : _returnDate)) {
      setState(() {
        if (isDepartureDate) {
          _departureDate = picked;
        } else {
          _returnDate = picked;
        }
      });
    }
  }

  void dispatchFlightOffers(BuildContext context) {
    final depature = inputFrom.toUpperCase();
    final arrival = inputTo.toUpperCase();
    final departureDate = DateFormat('yyyy-MM-dd').format(_departureDate);
    final numberOfPassengers = selectedNumber.toString();

    BlocProvider.of<FlightOffersBloc>(context).add(SearchAvailableFlights(
      params: AvailableFlightParams(
        departure: depature,
        arrival: arrival,
        departureDate: departureDate,
        numberOfPassengers: numberOfPassengers,
      ),
    ));
    // print("(0) -----> Inputdata: departure: $depature, arrival: $arrival, date: $departureDate, numberOfPassengers: $numberOfPassengers,");
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    //passengerController.dispose();
    super.dispose();
  }
}

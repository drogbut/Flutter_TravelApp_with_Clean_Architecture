import 'dart:core';

import 'package:flutter/cupertino.dart';

///   How to create without extending:
///   final be = BusinessException(
///       message: "error", localizedGetter: (localization) => localization.errorDefault);
///
///   Call from UI:
///   be.localizedMessage(context)
class BusinessException implements Exception {
  /// A message describing the error.
  final String? message;
  final Object? cause;
  final String Function(String localization)? localizedGetter;

  BusinessException({this.message, this.cause, this.localizedGetter});

  String localizedMessage(final BuildContext context) {
    final localization = 'AppLocalizations.of(context)!';
    return localizedGetter?.call(localization) ?? 'localization.errorDefault';
  }

  @override
  String toString() {
    if (cause != null) return cause.toString();
    Object? message = this.message;
    if (message == null) return runtimeType.toString();
    return '$runtimeType: $message';
  }
}

class InternetConnectionException extends BusinessException {
  InternetConnectionException({required super.cause})
      : super(
          message: 'Network error',
          localizedGetter: (localization) => 'localization.errorNetwork',
        );
}

class ApiNotFoundException extends BusinessException {
  ApiNotFoundException({required super.cause})
      : super(
          message: 'Api Not Found',
          localizedGetter: (localization) => 'localization.errorApiNotFound',
        );
}

class InternalServerException extends BusinessException {
  InternalServerException({required int statusCode, required super.cause})
      : super(
          message: 'Internal Server Error: $statusCode',
          localizedGetter: (localization) => 'localization.errorServer',
        );
}

class ClientRequestException extends BusinessException {
  ClientRequestException({required int statusCode, required super.cause})
      : super(
          message: 'Client request error: $statusCode',
          localizedGetter: (localization) => 'localization.errorParsingRequest',
        );
}

class NoDataException extends BusinessException {
  NoDataException({super.cause})
      : super(
          message: 'No data exception',
          localizedGetter: (localization) => 'localization.errorNoDataReceived',
        );
}

class AuthorizationException extends BusinessException {
  AuthorizationException({required super.cause})
      : super(
          message: 'Unauthorized',
          localizedGetter: (localization) => 'localization.errorUnauthorized',
        );
}

class ParseException extends BusinessException {
  ParseException({super.cause})
      : super(
          message: 'Parse exception',
          localizedGetter: (localization) => 'localization.errorParsingRequest',
        );
}

class LocationServiceException extends BusinessException {
  LocationServiceException({super.cause})
      : super(
          message: 'Location service exception',
          localizedGetter: (localization) =>
              'localization.errorLocationService',
        );
}

class IncompleteAddressException extends BusinessException {
  IncompleteAddressException({super.cause})
      : super(
          message: 'Incomplete address exception',
          localizedGetter: (localization) =>
              'localization.errorIncompleteAddress',
        );
}

class AddressNotFoundException extends BusinessException {
  AddressNotFoundException({super.cause})
      : super(
          message: 'Address Not Found',
          localizedGetter: (localization) =>
              'localization.errorAddressNotFound',
        );
}

class LocationPermissionException extends BusinessException {
  LocationPermissionException({super.cause})
      : super(
          message: 'Location permissions exception',
          localizedGetter: (localization) =>
              'localization.errorLocationPermission',
        );
}

class LocationRetrievingException extends BusinessException {
  LocationRetrievingException({super.cause})
      : super(
          message: 'Location retrieving exception',
          localizedGetter: (localization) =>
              'localization.errorLocationRetrieving',
        );
}

class UnknownException extends BusinessException {
  UnknownException({super.cause})
      : super(
          localizedGetter: (localization) => 'localization.errorUnknown',
        );
}

class CartItemNotFoundException extends BusinessException {
  CartItemNotFoundException({super.cause})
      : super(
          message: 'Cart item not found',
          localizedGetter: (localization) =>
              'localization.errorCartItemNotFound',
        );
}

class CommunicationTypeNotFoundException extends BusinessException {
  CommunicationTypeNotFoundException({super.cause})
      : super(
          message: 'Communication type Not Found',
          localizedGetter: (localization) =>
              'localization.errorCommunicationTypeNotFound',
        );
}

class EmailAlreadyExistsError extends BusinessException {
  EmailAlreadyExistsError({super.cause})
      : super(
          message: 'Email already exists error',
          localizedGetter: (localization) =>
              'localization.errorEmailAlreadyExists',
        );
}

class InvalidEmailConfirmationCodeError extends BusinessException {
  InvalidEmailConfirmationCodeError({super.cause})
      : super(
          message: 'Invalid email confirmation code error',
          localizedGetter: (localization) =>
              'localization.labelInvalidConfirmationCode',
        );
}

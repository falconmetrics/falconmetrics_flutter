import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  const UserData({
    this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.city,
    this.state,
    this.postalCode,
    this.country,
  });

  final String? email;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;

  @override
  List<Object?> get props => [
    email,
    phoneNumber,
    firstName,
    lastName,
    dateOfBirth,
    city,
    state,
    postalCode,
    country,
  ];
}

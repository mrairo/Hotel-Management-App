import'package:hotel/domain/models/room_model.dart';
import'package:hotel/domain/models/user_model.dart';
// class BookingModel {
//   final String id;
//   final String userId;

//   BookingModel({
//     required this.id,
//     required this.userId,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'userId': userId,
//     };
//   }

//   factory BookingModel.fromJson(Map<String, dynamic> json) {
//     return BookingModel(
//       id: json['id'],
//       userId: json['userId'],
//     );
//   }
// }
//
class Booking{
  final String? id;
  final String hotelName;
  final List room;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfGuest;
  final double totalCost;
  final UserModel user;

  Booking({
    this.id,
    required this.hotelName,
    required this.room,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfGuest,
    required this.totalCost,
    required this.user, 
  });

  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'hotelName': hotelName,
      'room': room.map((e) => e.toJson()).toList(),
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'numberOfGuest': numberOfGuest,
      'totalCost': totalCost,
      'user': user.toJson(),
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    //check error over here and also in my " booking_sccreen .dart"
    return Booking(
      id: json['id'],
      hotelName: json['hotelName'],
      room: json['room'].map((e)=> Room.fromJson(e)).toList(),
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      numberOfGuest: json['numberOfGuest'],
      totalCost: json['totalCost'],
      user: UserModel.fromJson(json['user']),
    );
  }
} 
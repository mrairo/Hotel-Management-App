import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel/domain/models/booking_model.dart';

import '../models/booking_model.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get Bookings
  Future<List<Booking>> getBookings() async {
    QuerySnapshot snapshot= await _firestore.collection('bookings').get();
     return snapshot.docs
     .map((doc) => Booking.fromJson(doc.data()as Map<String, dynamic>))
     .toList();
  }

  //add new booking 
  Future<void> addBooking(Booking booking)async {
    await _firestore.collection('bookings').add(booking.toJson());
  }

  //update a booking
  Future<void> updateBooking(Booking booking)async {
    await _firestore.collection('bookings').add(booking.toJson());
  }

  //update a booking
  Future<void> deleteBooking(Booking booking)async {
   await _firestore
   .collection('bookings')
   .doc(booking.id.toString())
   .update(booking.toJson());
  }

  //deleting a booking
  Future<void> deleteBookingById(String id)async {
    await _firestore.collection('bookings').doc(id).delete();
  }
}

// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hotel/providers/hotel_provider.dart';
import 'package:provider/provider.dart';
// import 'package:stayzen/domain/models/hotel_model.dart';
import 'package:hotel/domain/models/hotel_model.dart';
// import 'package:stayzen/providers/hotel_provider.dart';
import 'package:hotel/providers/hotel_provider.dart';

class DeleteHotel extends StatefulWidget {
  final Hotel hotel;
  
  DeleteHotel({Key? key, required this.hotel}) : super(key: key);

  @override
  State<DeleteHotel> createState() => _DeleteHotelState();
}

class _DeleteHotelState extends State<DeleteHotel> {
  bool _isLoading = false;

  void _deleteHotel() async {
  try {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<HotelProvider>(context, listen: false).deleteHotel(widget.hotel); // Assuming you want to close the dialog on successful deletion
  } catch (e) {
    print('Error deleting hotel: $e');
    // Optionally show an error message here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to delete hotel: ${e.toString()}'))
    );
  } finally {
    setState(() {
      _isLoading = false;
    });
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();  // Close the dialog if still open and error occurred
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        showDialog(
          context: context, 
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text("Confirm delete"),
              content: Text('Are you sure you want to delete this hotel?'),
              actions: <Widget> [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(dialogContext).pop(),
                ),
                TextButton(
                  onPressed: _isLoading ? null : () {
                    _deleteHotel();
                  },
                  child: _isLoading ? CircularProgressIndicator():Text('Delete Hotel'),
                )
              ],
            );
          },
        );
      },
      );
  }
}
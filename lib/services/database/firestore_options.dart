


import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  //get collection of orders 
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  
  //save order to db
  Future<void> saveOrderToDatabase(String receipt) async{
  try {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
      // add more fields as necessary...
    });
  } on FirebaseException catch (e) {
    print('Error adding order: ${e.message}');
  } catch (e) {
    print('Unknown error: $e');
  }
  }
  
}
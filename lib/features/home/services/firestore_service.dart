import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mart/features/home/models/products_model.dart';

class FirestoreService {
  final ProductModel product;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addProduct() async {
    try {
      await _db.collection('Products').add({
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'image': product.imageUrl,
        'description': product.description,
        'isFavourite': product.isFavourite,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      QuerySnapshot snapshot = await _db.collection('Products').get();
      List<ProductModel> products = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductModel(
          data['id'],
          data['name'],
          data['price'],
          data['image'],
          data['description'],
          data['isFavourite'],
        );
      }).toList();

      return products;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  FirestoreService(this.product);
}

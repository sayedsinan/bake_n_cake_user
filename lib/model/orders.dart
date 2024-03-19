class ProductOrder {
  final int kg;
  final String productName;
  final String customerName;
  final String paymentStatus;

  ProductOrder({
    required this.kg,
    required this.productName,
    required this.customerName,
    required this.paymentStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'customerName': customerName,
      'paymentStatus': paymentStatus,
    };
  }
}

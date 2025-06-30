class OrderResponseEntity {
 
   final bool status;
  final String resultMessage;
  final String? refNo;

  const OrderResponseEntity({
   
     required this.status,
    required this.resultMessage,
    this.refNo,
  });
}


class OrderRequestEntity {
  final String dosyahName;
  final int dosyahCount;
  final int orderAcceptance;
  final String? libraryName;
  final String libraryPhoneNumber;
  final int? orderLocation;
  final String? errorMessage;
  final String? message;
  final String? status;


  

  const OrderRequestEntity({
    required this.dosyahName,
    required this.dosyahCount,
    required this.orderAcceptance,
     this.libraryName,
    required this.libraryPhoneNumber,
     this.orderLocation,
      this.errorMessage,
      this.message,
      this.status,

    
  });

  
}


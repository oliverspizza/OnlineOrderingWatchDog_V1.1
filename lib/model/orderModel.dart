import 'dart:core';

class OrderHistory {
  final double id;
  final String CustomerName;
  final String CustomerMobile;
  final String CustomerEmail;
  final String CustomerAddress;
  final String CustomerState;
  final double CustomerZip;
  final double OrderAmount;
  final double TaxAmount;
  final double DeliveryAmount;
  final double TotalAmount;
  final double Tax;
  final double Discount;
  final String Status;
  final double CCNo;
  final double CCExpiry;
  final String CCName;
  final String CCType;
  final double Tip;
  final DateTime CreatedDate;
  final double FutureOrder;
  final DateTime FutureDate;
  final String OrderType;
  final String CustomerCity;

  OrderHistory({
    this.DeliveryAmount,
    this.TotalAmount,
    this.Tip,
    this.CreatedDate,
    this.FutureOrder,
    this.FutureDate,
    this.id,
    this.CustomerName,
    this.CustomerAddress,
    this.CustomerCity,
    this.CustomerEmail,
    this.CustomerMobile,
    this.CustomerState,
    this.CustomerZip,
    this.OrderAmount,
    this.OrderType,
    this.TaxAmount,
    this.Tax,
    this.Discount,
    this.Status,
    this.CCNo,
    this.CCExpiry,
    this.CCName,
    this.CCType,
  });

  OrderHistory.fromJson(Map<String, dynamic> json)
      : CustomerName = json['CustomerName'],
        DeliveryAmount = json['DeliveryAmount'],
        TotalAmount = json['TotalAmount'],
        Tip = json['Tip'],
        CreatedDate = json['CreatedDate'],
        FutureOrder = json['FutureOrder'],
        FutureDate = json['FutureDate'],
        id = json['id'],
        CustomerAddress = json['CustomerAddress'],
        CustomerCity = json['CustomerCity'],
        CustomerEmail = json['CustomerEmail'],
        CustomerMobile = json['CustomerMobile'],
        CustomerState = json['CustomerState'],
        CustomerZip = json['CustomerZip'],
        OrderAmount = json['OrderAmount'],
        OrderType = json['OrderType'],
        TaxAmount = json['TaxAmount'],
        Tax = json['Tax'],
        Discount = json['Discount'],
        Status = json['Status'],
        CCNo = json['CCNo'],
        CCExpiry = json['CCExpiry'],
        CCName = json['CCName'],
        CCType = json['CCType'];

  Map<String, dynamic> toJson() {
    return {
      'CustomerName': CustomerName,
      'DeliveryAmount': DeliveryAmount,
      'TotalAmount': TotalAmount,
      'Tip': Tip,
      'CreatedDate': CreatedDate,
      'FutureOrder': FutureOrder,
      'FutureDate': FutureDate,
      'id': id,
      'CustomerAddress': CustomerAddress,
      'CustomerCity': CustomerCity,
      'CustomerEmail': CustomerEmail,
      'CustomerMobile': CustomerMobile,
      'CustomerState': CustomerState,
      'CustomerZip': CustomerZip,
      'OrderAmount': OrderAmount,
      'OrderType': OrderType,
      'TaxAmount': TaxAmount,
      'Tax': Tax,
      'Discount': Discount,
      'Status': Status,
      'CCNo': CCNo,
      'CCExpiry': CCExpiry,
      'CCName': CCName,
      'CCType': CCType
    };
  }
}

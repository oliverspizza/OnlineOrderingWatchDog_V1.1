import 'dart:core';

class OrderItemDetail {
  final double id;
  final double OrderID;
  final double ParentID;
  final String CustomerEmail;
  final String CustomerAddress;
  final String RefId;
  final double MDT_ID;
  final double IP_ID;
  final String RefName;
  final String RefType;
  final double ItemAmount;
  final DateTime CreatedDate;
  final double Qty;
  final String MI_ID;
  final String MI_Name;
  final String IC_ID;
  final String IC_Name;

  OrderItemDetail(
      {this.id,
      this.OrderID,
      this.ParentID,
      this.CustomerEmail,
      this.CustomerAddress,
      this.RefId,
      this.MDT_ID,
      this.IP_ID,
      this.RefName,
      this.RefType,
      this.ItemAmount,
      this.CreatedDate,
      this.Qty,
      this.MI_ID,
      this.MI_Name,
      this.IC_ID,
      this.IC_Name});

  OrderItemDetail.fromJson(Map json)
      : id = json['id'],
        OrderID = json['OrderID'],
        ParentID = json['ParentID'],
        CustomerEmail = json['CustomerEmail'],
        CustomerAddress = json['CustomerAddress'],
        RefId = json['RefId'],
        MDT_ID = json['MDT_ID'],
        IP_ID = json['IP_ID'],
        RefName = json['RefName'],
        RefType = json['RefType'],
        ItemAmount = json['ItemAmount'],
        CreatedDate = json['CreatedDate'],
        Qty = json['Qty'],
        MI_ID = json['MI_ID'],
        MI_Name = json['MI_Name'],
        IC_ID = json['IC_ID'],
        IC_Name = json['IC_Name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'OrderID': OrderID,
      'ParentID': ParentID,
      'CustomerEmail': CustomerEmail,
      'CustomerAddress': CustomerAddress,
      'RefId': RefId,
      'MDT_ID': MDT_ID,
      'IP_ID': IP_ID,
      'RefName': RefName,
      'RefType': RefType,
      'ItemAmount': ItemAmount,
      'CreatedDate': CreatedDate,
      'Qty': Qty,
      'MI_ID': MI_ID,
      'MI_Name': MI_Name,
      'IC_ID': IC_ID,
      'IC_Name': IC_Name,
    };
  }
}

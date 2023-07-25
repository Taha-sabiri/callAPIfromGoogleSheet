class DataModel {
  String? cost;
  String? data;

  DataModel({
    this.data,
    this.cost,
  });

  factory DataModel.fromJson(dynamic json) {
    return DataModel(
      data: "${json['dataPay']}",
      cost: "${json['costPay']}",
    );
  }
  Map toJson() => {
        'dataPay': data,
        'costPay': cost,
      };
}

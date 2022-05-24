// import 'dart:convert';
// To parse this JSON data, do
//     final scanModel = scanModelFromJson(jsonString);
// ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
// String scanModelToJson(ScanModel data) => json.encode(data.toJson());
import 'package:latlong/latlong.dart';

class ScanModel {
  String tipo;
  String valor;
  int id;

  ScanModel({
    this.id,
    this.tipo,
    this.valor,
  }) {
    if (this.valor.contains('http')) {
      this.tipo = 'http';
    } else {
      this.tipo = 'geo';
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };

  LatLng getLatLng() {
    // geo:40.724233047051705,-74.00731459101564
    final lalo = valor.substring(4).split(',');
    final lat = double.parse(lalo[0]);
    final lng = double.parse(lalo[1]);
    return LatLng(lat, lng);
  }
}

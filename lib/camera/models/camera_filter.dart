import 'package:flutter/material.dart';

class CameraFilter {
  final String nome;
  final ColorFilter? filtro;

  const CameraFilter({
    required this.nome,
    this.filtro,
  });
}
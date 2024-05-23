import 'package:flutter/material.dart';

import '../model/shoes_model.dart';

class ShoesItem extends StatelessWidget {
  const ShoesItem({super.key, this.onAdd, this.onRemove, this.onDelete, required this.shoe,});

  final Function()? onAdd;
  final Function()? onRemove;
  final Function()? onDelete;
  final ShoesModel shoe;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
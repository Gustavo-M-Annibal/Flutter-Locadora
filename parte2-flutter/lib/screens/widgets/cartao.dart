import 'package:flutter/material.dart';
import '../../models/filme.dart';

/// Exercício 6 — Cartão do item
/// Recurso obrigatório: Container — Conceito: BoxDecoration
/// (cor vai dentro do decoration, nunca junto com `color:` no Container)
class Cartao extends StatelessWidget {
  final Filme filme;
  final VoidCallback? onTap;

  const Cartao({super.key, required this.filme, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              filme.titulo,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('${filme.duracaoMinutos} min'),
          ],
        ),
      ),
    );
  }
}

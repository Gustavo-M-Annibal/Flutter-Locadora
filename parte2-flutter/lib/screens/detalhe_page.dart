import 'package:flutter/material.dart';
import '../models/filme.dart';

/// Exercício 8 — Navegação com passagem de dados
/// O objeto chega aqui pelo construtor, vindo de Navigator.push na home_page.
/// Mostra 2 dados que NÃO aparecem no cartão: preço e data de lançamento.
class DetalhePage extends StatelessWidget {
  final Filme filme;

  const DetalhePage({super.key, required this.filme});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE6),
      appBar: AppBar(
        title: Text(filme.titulo),
        centerTitle: true,
        backgroundColor: const Color(0xFF6B1E23),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF6B1E23), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _linha('Nome do Filme', filme.titulo),
              const SizedBox(height: 12),
              _linha('Preço', 'R\$ ${filme.preco.toStringAsFixed(2)}'),
              const SizedBox(height: 12),
              _linha(
                'Data de lançamento',
                '${filme.dataLancamento.day}/'
                '${filme.dataLancamento.month}/${filme.dataLancamento.year}',
              ),
              const SizedBox(height: 12),
              _linha('Tempo de duração', '${filme.duracaoMinutos} min'),
            ],
          ),
        ),
      ),
    );
  }  Widget _linha(String rotulo, String valor) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, color: Colors.black),
        children: [
          TextSpan(
            text: '$rotulo: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B1E23),
            ),
          ),
          TextSpan(text: valor),
        ],
      ),
    );
  }
}
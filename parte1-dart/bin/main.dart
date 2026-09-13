// TODO: Exercícios 1-4 — relatório com os 4 blocos ([1] ENTIDADE PRINCIPAL,
// [2] HERANÇA, [3] COMPOSIÇÃO, [4] ENCAPSULAMENTO), impresso via print().

import 'models/filme.dart';

void main() {
  // ===== [1] ENTIDADE PRINCIPAL =====
  print('===== [1] ENTIDADE PRINCIPAL =====');
  final filme1 = Filme(
    titulo: 'O Poderoso Chefão',
    duracaoMinutos: 175,
    preco: 14.90,
    dataLancamento: DateTime(1972, 3, 24),
  );
  print(
    'Filme: ${filme1.titulo} | ${filme1.duracaoMinutos} min | '
    'R\$ ${filme1.preco} | ${filme1.dataLancamento.year}',
  );
  print('');
}
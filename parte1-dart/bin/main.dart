// TODO: Exercícios 1-4 — relatório com os 4 blocos ([1] ENTIDADE PRINCIPAL,
// [2] HERANÇA, [3] COMPOSIÇÃO, [4] ENCAPSULAMENTO), impresso via print().

import 'models/filme.dart';
import 'models/filme_legendado.dart';
import 'models/locadora.dart';

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

  // ===== [2] HERANÇA =====
  print('===== [2] HERANÇA =====');
  final filmeComum = Filme(
    titulo: 'Parasita',
    duracaoMinutos: 132,
    preco: 12.50,
  );
  final filmeLegendado = FilmeLegendado(
    titulo: 'Parasita',
    duracaoMinutos: 132,
    preco: 12.50,
    idioma: 'Coreano',
    estudioDublagem: 'N/A - Legendado',
  );
  print('Filme comum -> ficha: "${filmeComum.ficha()}"');
  print('FilmeLegendado -> ficha: "${filmeLegendado.ficha()}"');
  print('');

  // ===== [3] COMPOSIÇÃO =====
  print('===== [3] COMPOSIÇÃO =====');
  final locadora = Locadora(nome: 'Locadora Central');
  locadora.adicionar(filme1);
  locadora.adicionar(filmeComum);
  locadora.adicionar(FilmeLegendado(
    titulo: 'Cidade de Deus',
    duracaoMinutos: 130,
    preco: 10.00,
    idioma: 'Português',
    estudioDublagem: 'N/A - Legendado',
  ));
  print('Locadora "${locadora.nome}" contém ${locadora.filmes.length} filmes:');
  for (final f in locadora.filmes) {
    print('  - ${f.titulo}');
  }
  print('');

  // ===== [4] ENCAPSULAMENTO =====
  print('===== [4] ENCAPSULAMENTO =====');
  print(
    'Locadora "${locadora.nome}" -> duração total (calculada): '
    '${locadora.duracaoTotalMinutos} min',
  );
  locadora.adicionar(Filme(
    titulo: 'Interestelar',
    duracaoMinutos: 169,
    preco: 15.00,
  ));
  print(
      'Após adicionar "Interestelar" (169 min): ${locadora.duracaoTotalMinutos} min');
}

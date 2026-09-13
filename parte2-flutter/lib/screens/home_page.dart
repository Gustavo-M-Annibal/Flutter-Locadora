import 'package:flutter/material.dart';
import '../models/filme.dart';
import '../models/filme_legendado.dart';
import '../models/locadora.dart';
import 'widgets/cartao.dart';
import 'detalhe_page.dart';
import 'cadastro_page.dart';

/// Exercício 10 — Estado
/// StatefulWidget que guarda o objeto agrupador (Locadora) e o atualiza
/// dentro de setState quando um filme novo é cadastrado.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Locadora _locadora = Locadora(nome: 'Locadora Central');

  @override
  void initState() {
    super.initState();
    // Já entra com 6 itens — sem tela de abertura, sem carregamento.
    _locadora.adicionar(Filme(
      titulo: 'O Poderoso Chefão',
      duracaoMinutos: 175,
      preco: 14.90,
      dataLancamento: DateTime(1972, 3, 24),
    ));
    _locadora.adicionar(FilmeLegendado(
      titulo: 'Parasita',
      duracaoMinutos: 132,
      preco: 12.50,
      dataLancamento: DateTime(2019, 5, 30),
      idioma: 'Coreano',
      estudioDublagem: 'N/A - Legendado',
    ));
    _locadora.adicionar(Filme(
      titulo: 'Interestelar',
      duracaoMinutos: 169,
      preco: 15.00,
      dataLancamento: DateTime(2014, 11, 6),
    ));
    _locadora.adicionar(FilmeLegendado(
      titulo: 'Cidade de Deus',
      duracaoMinutos: 130,
      preco: 10.00,
      dataLancamento: DateTime(2002, 8, 30),
      idioma: 'Português',
      estudioDublagem: 'N/A - Legendado',
    ));
    _locadora.adicionar(Filme(
      titulo: 'A Origem',
      duracaoMinutos: 148,
      preco: 13.50,
      dataLancamento: DateTime(2010, 7, 16),
    ));
    _locadora.adicionar(Filme(
      titulo: 'Whiplash',
      duracaoMinutos: 106,
      preco: 11.00,
      dataLancamento: DateTime(2014, 10, 10),
    ));
  }

  void _abrirCadastro() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CadastroPage(
          aoConfirmar: (novoFilme) {
            // Alterar a lista FORA do setState não muda nada na tela —
            // o Flutter só reconstrói quando é avisado.
            setState(() {
              _locadora.adicionar(novoFilme);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filmes = _locadora.filmes;

    return Scaffold(
      // Exercício 5 — Scaffold com AppBar
      appBar: AppBar(title: const Text('Locadora Central')),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        tooltip: 'Cadastrar filme',
        child: const Icon(Icons.add),
      ),
      body: Column(
        // Exercício 5 — alinhamentos explícitos nos dois eixos
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Duração total: ${_locadora.duracaoTotalMinutos} min',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Exercício 7 — ListView.builder dentro de Expanded (sem isso,
          // a Column e a ListView brigam pela mesma altura infinita).
          Expanded(
            child: ListView.builder(
              itemCount: filmes.length,
              itemBuilder: (context, index) {
                final filme = filmes[index];
                return Cartao(
                  filme: filme,
                  onTap: () {
                    // Exercício 8 — passa o objeto pelo construtor da tela
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetalhePage(filme: filme),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

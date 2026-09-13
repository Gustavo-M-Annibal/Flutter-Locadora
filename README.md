# Trabalho 1º Bimestre — Programação para Dispositivos Móveis

**Integrantes:** [Gustavo M. Annibal], [Arthur]

**Domínio:** Locadora de filmes. As entidades são `Filme` (o item individual)
e `Locadora` (que agrupa vários filmes) — uma relação de composição: a
locadora *tem* filmes, não *é* um filme.

## Tabela de rastreio

| # | Exercício | Arquivo e linha | O que aparece na tela |
|---|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/filme.dart:3` | Bloco [1] do relatório |
| 2 | Herança | `parte1-dart/bin/models/filme_legendado.dart:7` (construtor com `super` na linha 18) | Bloco [2] do relatório |
| 3 | Composição | `parte1-dart/bin/models/locadora.dart:9` (lista na linha 11) | Bloco [3] do relatório |
| 4 | Encapsulamento | `parte1-dart/bin/models/locadora.dart:23` (getter `duracaoTotalMinutos`) | Bloco [4] e o total no topo da tela de lista |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:87` | AppBar e corpo da tela inicial |
| 6 | Cartão | `parte2-flutter/lib/screens/widgets/cartao.dart:7` | Cada item da lista |
| 7 | Lista | `parte2-flutter/lib/screens/home_page.dart:121` | Lista rolável com seis itens |
| 8 | Navegação | `parte2-flutter/lib/screens/home_page.dart:130` | Toque no item abre o detalhe |
| 9 | Formulário | `parte2-flutter/lib/screens/cadastro_page.dart:8` | Tela de cadastro |
| 10 | Estado | `parte2-flutter/lib/screens/home_page.dart:72` | Item novo na lista e total atualizado |

## Como rodar

**Parte 1 (Dart puro):**
```
cd parte1-dart
dart pub get
dart run
```

**Parte 2 (Flutter):**
```
cd parte2-flutter
flutter pub get
flutter run
```
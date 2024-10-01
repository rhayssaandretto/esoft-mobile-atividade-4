import 'package:flutter/material.dart';
import 'package:my_bank_app/screens/transacao_form.dart';

import '../components/list_card.dart';
import '../models/enums/tipo_transacao.dart';
import '../models/transacao.dart';

class Transacoes extends StatefulWidget {
  Transacoes({super.key});

  final List<Transacao> _transacoes = [
    Transacao(TipoTransacao.credito, 200.0),
    Transacao(TipoTransacao.debito, 45.0)
  ];

  @override
  State<StatefulWidget> createState() => _TransacoesState();
}

class _TransacoesState extends State<Transacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transações Bancárias')),
      body: ListView.builder(
        itemCount: widget._transacoes.length,
        itemBuilder: (context, index) {
          return ListCard(
            title: widget._transacoes[index].valor.toString(),
            subtitle: widget._transacoes[index].tipo.name,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransacaoForm()),
          ).then((novaTransacao) {
            if (novaTransacao != null) {
              _atualizarTransacoes(novaTransacao);
            }
          });
        },
      ),
    );
  }

  void _atualizarTransacoes(Transacao novaTransacao) {
    setState(() {
      widget._transacoes.add(novaTransacao);
    });
  }
}

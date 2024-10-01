import 'package:flutter/material.dart';
import 'package:my_bank_app/models/enums/tipo_transacao.dart';
import 'package:my_bank_app/models/transacao.dart';

class TransacaoForm extends StatefulWidget {
  final TextEditingController _ctrlValor = TextEditingController();

  TransacaoForm({super.key});

  @override
  State<StatefulWidget> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário Transações Bancárias')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget._ctrlValor,
                decoration:
                    const InputDecoration(labelText: "Valor da transação:"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  return _criarTransacao(context);
                },
                child: const Text("confirmar"))
          ],
        ),
      ),
    );
  }

  void _criarTransacao(BuildContext context) {
    final double? valorTransacao = double.tryParse(widget._ctrlValor.text);

    if (valorTransacao != null) {
      final transacao = Transacao(TipoTransacao.credito, valorTransacao);
      Navigator.pop(context, transacao);
    }
  }
}

import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Tarjeta de Crédito o Débito"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("PayPal"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text("Transferencia Bancaria"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
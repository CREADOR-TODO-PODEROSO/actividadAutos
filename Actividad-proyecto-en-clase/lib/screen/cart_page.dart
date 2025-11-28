import 'package:flutter/material.dart';
import 'payment_page.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Producto 1
            CartItem(
              name: "Auto Deportivo Modelo X",
              price: 25000.00,
            ),

            // Producto 2
            CartItem(
              name: "Auto Familiar Modelo Y",
              price: 18000.00,
            ),

            SizedBox(height: 20),

            // Cuadrado de resumen
            SummaryBox(),

            SizedBox(height: 20),

            // Botón Check Out
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentPage()),
                  );
                },
                child: Text("Check Out"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 50,
            color: Colors.grey[300], // área para imagen
          ),
          SizedBox(width: 10),

          // Nombre y precio
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text("\$${price.toStringAsFixed(2)}"),
              ],
            ),
          ),

          // Cantidad
          Row(
            children: [
              Icon(Icons.remove),
              SizedBox(width: 10),
              Text("1"),
              SizedBox(width: 10),
              Icon(Icons.add),
            ],
          )
        ],
      ),
    );
  }
}

class SummaryBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SummaryRow(text: "Items (2)", value: "\$43000.00"),
          SummaryRow(text: "Envío", value: "\$150.00"),
          SummaryRow(text: "Impuestos", value: "\$2200.00"),

          Divider(),

          SummaryRow(
            text: "Total",
            value: "\$45350.00",
            isBold: true,
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String text;
  final String value;
  final bool isBold;

  SummaryRow({required this.text, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shopping_getx/model/order.dart';

class OrderDetail extends StatefulWidget {
  final Order order;
  const OrderDetail({super.key, required this.order});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var _expand = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Rs: ${widget.order.total.toString()}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expand ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expand = !_expand;
                });
              },
            ),
          ),
          if (_expand)
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              height: min(widget.order.cartProduct.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.order.cartProduct
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                              '${prod.qunitiy.toString()} X ${prod.price.toString()}',
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}

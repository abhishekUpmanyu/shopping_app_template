import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapptemplate/ui/animated_counter.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Widget _itemsListBuilder(BuildContext context, int index) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('product'),
            ],
          ),
          Row(
            children: <Widget>[
              AnimatedCounter()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/12),
        child: AppBar(
          backgroundColor: Color(0xFFFFB7B2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(MediaQuery.of(context).size.height/25),
                  bottomRight: Radius.circular(MediaQuery.of(context).size.height/25))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear_all, color: Colors.white),
              onPressed: () {},
            )
          ],
          centerTitle: true,
          title: Text('Shopping Cart'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {}),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFFFB7B2),
          onPressed: () {},
          label: Text('Checkout'),
          icon: Icon(Icons.chevron_right)),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Your Items'),
          ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  _itemsListBuilder(context, index),
              itemCount: 2,
              shrinkWrap: true)
        ],
      )),
    );
  }
}

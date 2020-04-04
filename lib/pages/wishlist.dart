import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<Widget> wishlistItems;

  bool _showSearch = false;

  void initState() {
    setState(() {
      wishlistItems = [
        itemTile(
            'First Item Example Ye Wala Hai',
            'https://image.shutterstock.com/image-vector/sample-redblack-sign-blackred-round-260nw-1527866849.jpg',
            220.0),
        itemTile(
            'Items ke Naam Usually Bade Hote Hai Need to Fill Space',
            'https://image.shutterstock.com/image-vector/sample-redblack-sign-blackred-round-260nw-1527866849.jpg',
            1102.0)
      ];
    });
    super.initState();
  }

  Widget itemTile(String title, String imageUrl, double price) {
    return Material(
      color: Colors.white,
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Image.network(imageUrl, fit: BoxFit.contain, width: 100),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.black87), overflow: TextOverflow.fade,),
                          Text('Available', style: TextStyle(color: Colors.green))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('₹ ', style: TextStyle(color: Colors.deepOrangeAccent)),
                          Text(price.toString(), style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20.0))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Material(
                  elevation: 2.0,
                  child: InkWell(
                    onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.add_shopping_cart),
                            Text('Add to Cart')
                          ],
                        ),
                      )),
                ),
              ),
              Expanded(
                child: Material(
                  elevation: 2.0,
                  child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.shopping_cart),
                            Text('Move to Cart')
                          ],
                        ),
                      )),
                ),
              ),
              Expanded(
                child: Material(
                  elevation: 2.0,
                  child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.delete),
                            Text('Remove')
                          ],
                        ),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_showSearch?MediaQuery.of(context).size.height / 8:MediaQuery.of(context).size.height / 12),
        child: AppBar(
          backgroundColor: Color(0xFFE39677),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(MediaQuery.of(context).size.height / 25),
                  bottomRight: Radius.circular(
                      MediaQuery.of(context).size.height / 25))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () => setState(() => _showSearch = !_showSearch),
            )
          ],
          centerTitle: true,
          title: Text('Wishlist!'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {}),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: wishlistItems,
            ),
            Text('hi')
          ],
        ),
      ),
    );
  }
}

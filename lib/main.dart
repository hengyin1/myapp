import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping App')
        ),
        body: ShoppingList(
          products: <Product>[
            Product('Eggs'),
            Product('Flour'),
            Product('Chocolate chips'),
          ],
        ),
      ),
    );
  }
}

class Product {
  const Product(this.name);
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = <Product> {};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   return ListView(
     padding: EdgeInsets.symmetric(vertical: 8.0),
     children: widget.products.map((Product product) {
       return ShoppingListItem(product, _shoppingCart.contains(product), _handleCartChanged);
     }).toList(),
   );
  }
}

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(Product product, this.inCart, this.onCartChanged): product = product, super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to flutter'),
//         ),
//         body: MyHomePage()

//         // Container(
//         //   child: Row(
//         //     children: <Widget>[
//         //       IconButton(
//         //         icon: Icon(Icons.search), 
//         //         tooltip: 'search',
//         //         onPressed: () {
//         //           print('search');
//         //         }
//         //       ),
//         //       IconButton(
//         //         icon: Icon(Icons.menu), 
//         //         tooltip: 'menu',
//         //         onPressed: null
//         //       ),
//         //       IconButton(
//         //         icon: Icon(Icons.home), 
//         //         tooltip: 'home',
//         //         onPressed: null
//         //       ),
//         //       GestureDetector(
//         //         onTap: () {
//         //           print('sb');
//         //         },
//         //         onDoubleTap: () {
//         //           print('sb 2');
//         //         },
//         //         child: Container(
//         //           width: 200,
//         //           height: 200,
//         //           margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
//         //           color: Colors.blue,
//         //         ),
//         //       )
//         //     ],
//         //   ),
//         // ),

//         // body: Center(
//         //   child: Text(
//         //     'hello world', 
//         //     style: TextStyle(
//         //       color: Color.fromRGBO(255, 0, 0, 1), 
//         //       fontSize: 24, 
//         //       fontWeight: FontWeight.bold
//         //     ),
//         //   ),
//         // ),
//       )
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePage createState() => _MyHomePage();
// }

// class _MyHomePage extends State<MyHomePage> {
//   int _counter = 0;
  

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'You have pushed the button this many times:',
//           ),
//           Text(
//             '$_counter'
//           ),
//           FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: Icon(Icons.add))
//         ],
//       )
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
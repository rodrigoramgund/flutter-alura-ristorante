import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/food_item.dart';

import '../cardapio.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);

  final List items = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        //tem constraints que limitam seus filhos ao seu tamanho definidos
        slivers: <Widget>[
          const SliverToBoxAdapter(
            //text não eh um widget de slivers, então esse widget faz ele se adaptar
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Menu",
                style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FoodItem(
                  imageURI: items[index]["image"],
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

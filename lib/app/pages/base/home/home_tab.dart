import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/size_screen_extension.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';

import '../../../core/app_data.dart' as app_data;
import '../../../components/home/card_tile.dart';
import '../../../components/home/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  void itemSelectedCartAnimations(GlobalKey gkImages) {
    runAddToCartAnimation(gkImages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(color: context.primaryColor),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(color: Colors.red[700]),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                label: const Text(
                  '0',
                  style: TextStyle(fontSize: 12),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  badgeOptions: const BadgeOptions(
                    active: false,
                  ),
                  icon: Icon(Icons.shopping_cart_outlined,
                      color: context.primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
      body: AddToCartAnimation(
        
        cartKey: globalKeyCartItems,
        opacity: 0.50,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: true,
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate
          
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (addToCartAnimationMethod) {
          runAddToCartAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    hintText: 'Pesquise aqui...',
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                    suffixIcon: const Icon(Icons.search_outlined, size: 21),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide:
                            const BorderSide(style: BorderStyle.none, width: 0))),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => CategoryTile(
                  onTap: () {
                    setState(() {
                      selectedCategory = app_data.categories[index];
                    });
                  },
                  category: app_data.categories[index],
                  isSelected: app_data.categories[index] == selectedCategory,
                ),
                separatorBuilder: (_, index) => SizedBox(
                  width: 10.w,
                ),
                itemCount: app_data.categories.length,
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 9 / 11
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) => CardTile(
                  item: app_data.items[index],
                  cartAnimationMethod: itemSelectedCartAnimations
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

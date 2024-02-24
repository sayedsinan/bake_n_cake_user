import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/model/prodcuts.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/search/searchAppBar.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // var sizeof = MediaQuery.of(context);
  List<ProductModel> filteredProducts = [];
  final controller = Get.find<UserController>();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = controller.productslist;
    _searchController.addListener(() {
      setState(() {
        filteredProducts = controller.productslist
            .where((product) => product.name
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: maincolor,
      appBar: searchapp(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(30),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: appbarColor),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.all(30),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Card(
                      child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Container(
                                    height: sizeof.size.height * 0.119,
                                    color: Colors.black,
                                    child: SizedBox(
                                      width: sizeof.size.width * 1,
                                        child: Image.network(
                                      controller.productslist[index].image
                                          .toString(),
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: sizeof.size.width * 0.03,
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.productslist[index].name,
                                        style: normalstyling(15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: sizeof.size.height * 0.04,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: sizeof.size.width * 0.03,
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.productslist[index].price
                                            .toString(),
                                        style: normalstyling(15),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                    );
                  },
                  childCount: filteredProducts.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

}

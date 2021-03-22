import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providereg/Home/AddNewItem.dart';
import 'package:providereg/Model/ItemModel.dart';
import 'package:providereg/Model/bgColorMode.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return Consumer<BgColorProvider>(builder: (context, bgProvider, child) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: bgProvider.isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: bgProvider.isDark ? Colors.white : Colors.black,
          centerTitle: true,
          title: Text(
            'Provider Eg',
            style: TextStyle(
              color: bgProvider.isDark ? Colors.black : Colors.white,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.brightness_2,
                  color: bgProvider.isDark ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  bgProvider.changeThem();
                })
          ],
        ),
        body: Container(
          height: mainAxisHeight,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Consumer<CartItemListProvider>(
              builder: (context, provider, child) {
            print(provider.cartItemList?.length ?? 0);
            return ListView.builder(
                itemCount: provider.cartItemList?.length ?? 0,
                itemBuilder: (BuildContext context, int indexChild) {
                  Item item = provider.cartItemList[indexChild];
                  return Dismissible(
                      dismissThresholds: ({
                        DismissDirection.startToEnd: 0.6,
                        DismissDirection.endToStart: 0.6
                      }),
                      onDismissed: (_) {
                        provider.removeItem(item);
                      },
                      background: Container(
                        height: 90,
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color:
                              bgProvider.isDark ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.delete,
                            color:
                                bgProvider.isDark ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      key: UniqueKey(),
                      child: InkWell(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: width,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 5,
                                        color: bgProvider.isDark
                                            ? Colors.grey[100]
                                            : Colors.grey[400])
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Quantity ${item.quantity}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Size: ${item.size}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Deliver to: ${item.address}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ));
                });
          }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: bgProvider.isDark ? Colors.white : Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => AddItemWidget())));
          },
          child: Icon(
            Icons.add,
            color: bgProvider.isDark ? Colors.black : Colors.white,
          ),
        ),
      ));
    });
  }
}

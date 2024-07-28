import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:stock_sync/components/NavBar.dart";
import "package:stock_sync/components/RefStkTable.dart";
import "package:stock_sync/constants/Constants.dart";

class StockRef extends StatefulWidget {
  const StockRef({super.key});

  @override
  State<StockRef> createState() => _StockRefState();
}

class _StockRefState extends State<StockRef> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar(image: 'admin.png', user: "chameera"),

          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
            child: Container(
              width: 400,
              height: 500,
              color: primaryColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "view Stock",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: secondaryColor,
                      ),
                    ),
                    RefStkTable(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),

          // add buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit Bills"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: secondaryColor),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Set as Paid"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: secondaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

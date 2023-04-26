import 'package:flutter/material.dart';

import 'data/services/get_confectionary_service.dart';
import 'model/confectionary_model.dart';

class AvailableItemsScreen extends StatefulWidget {
  const AvailableItemsScreen({super.key});

  @override
  State<AvailableItemsScreen> createState() => _AvailableItemsScreenState();
}

class _AvailableItemsScreenState extends State<AvailableItemsScreen> {
  final TextEditingController _searchController = TextEditingController();

  Future<List<CategoryItem>?> getCat() async {
    var response = await GetConfectionaryService.register();
    return response!.categoryItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list of Confectionarie'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              FutureBuilder(
                  future: getCat(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.hasError) {
                      return CircularProgressIndicator();
                    } else {
                    return  Expanded(
                          child: ListView.builder(
                             itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = snapshot.data![index];
                         
                          return Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    data.productName.toString(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Expanded(child: Text(data.price.toString())),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(child: Text(data.quantity.toString())),
                                
                              ],
                            ),
                          );
                        },
                       
                       
                      ));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  
}

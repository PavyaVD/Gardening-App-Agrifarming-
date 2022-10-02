import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnapp/constants.dart';
import 'package:learnapp/planticons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
       
          
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivering to",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Colors.black45),
              ),
              InkWell(
                onTap: () {
                print("clicked");
              },
              child: Row(
                  children: [
                  Text(
                    "current location",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 25,
                  ),
                ],
              )
              )
            ],
          ),
           ),

                  body:SingleChildScrollView(
                     child: Padding(
                      padding: const EdgeInsets.all(8.0),
                       child: Column(
                                 crossAxisAlignment:CrossAxisAlignment.start,
                                 children: [
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Container(
                                         height: 50,
                                        // color: Colors.grey,
                                        margin: EdgeInsets.symmetric(vertical: 5),
                                       //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                        padding: EdgeInsets.only(left: 5),
                                         decoration: BoxDecoration(
                                     color: Colors.grey.shade300,
                                     borderRadius: BorderRadius.circular(30),
                                   ),
                                         child: Material(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: Row(
                          children: [
                            Image.asset(SEARCH_ICON,
                            height: 18,
                            width: 18,),
                            SizedBox(
                              width: 10,
                            ),
                           // Icon(Icons.search),
                            Text("Search topic",
                            style: Theme.of(context)
                            .textTheme
                            .subtitle1,
                            ),
                          ],
                                          ),
                        ),
                                         ),
                                       ),
                                     ),
                                      IconButton(
                                 onPressed: () {},
                                   icon:Image.asset(
                                   FILTER_ICON,
                                 height: 18,
                                 width: 18,
                                 color:Colors.blueGrey,
                                 ),
                                 
                                 )
                                   ],
                                 ),
                                 //search & filter complete
                                 SizedBox(
                                  height: 20),
                                  Text("Category",
                                  
                                  style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontWeight: FontWeight.bold,
                                  fontSize:18 ),
                                  ),
                                  
                                    Container(
                                      height: 115,

                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                      //  physics: NeverScrollableScrollPhysics(),
                                        itemCount: listCards.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(17),
                                            margin: EdgeInsets.only(top: 5,bottom: 2,right: 5, left: 8),
                                            width: 70,
                                            height: 70,
                                            color: Colors.green.withOpacity(0.3),
                                            borderRadius:BorderRadius.circular(10),
                                            child: Image.asset(listCards[index].imageUrl),
                                          ),
                                          Text(listCards[Index].title,
                                          style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87
                                          ),
                                          )
                                            ],
                                          ),
                                        },
                                      ),
                                    ),

                                    //big imagewith titlestarts
                                     Container(
                                      child.Column(
                                        CrossAxisAlignment:CrossAxisAlignment.start,

                                        children: [
                                          {
                                            ImageProvider<dynamic> image
                                            }
                                          Container(
                                            height: 220,
                                            margin: EdgeInsets,
                                            decoration: BoxDe,
                                            image:DecorationImage(image: AssetImage(plantimg),),
                                          ),
                                        //  Image.asset(plantimg),

                                          Text("Home Gardening"
                                          style:TextStyle(FontWeight:FontWeight.bold),
                                          
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                              color: Colors.purple,
                                              ),
                                              Text(
                                                "4.5",
                                                style:TextStyle(color: Colors.pink)
                                              ),
                                            ],
                                          ),
                                          
                                        ],
                                      ),
                                     ),
                                     //big imagewith titleends
                                
                                ],
                                 ),
                     ),

          ),
       
         
 );

































Class CategoryModel {
  String imageUrl;
  String title;
  String remoteUrl;
  CategoryModel(this.imageUrl, this.title, {required this.remoteUrl});

}
List<CategoryModel> listCards = [
  CategoryModel("assets/planticons/plant.png", "Home Plants"),
  CategoryModel("assets/planticons/tree.png", "Trees"),
  CategoryModel("assets/planticons/Spider-plant.png", "Pot Plants"),
];

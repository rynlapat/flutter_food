
import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_item.dart';
import 'package:google_fonts/google_fonts.dart';


class FoodDetailPage extends StatefulWidget {
  static const routeName = '/fooddetail';
  const FoodDetailPage({Key? key}) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {


  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!
        .settings.arguments as FoodItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name,style: GoogleFonts.mali(fontSize: 30.0,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/${data.image}'),
          SizedBox(height: 10.0,),
          Text('ชื่อเมนู : ${data.name}',style: GoogleFonts.mali(fontSize: 30.0,fontWeight: FontWeight.bold),),

          Text('ราคา : ${data.price}',style: GoogleFonts.mali(fontSize: 30.0,fontWeight: FontWeight.bold),),
        ],
      ),

    );
  }
}

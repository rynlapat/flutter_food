import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = ''; //สิ่งที่ user กดเข้ามาไว้ที่นี่
  var password = '123456';


  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 3.0),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow.shade100.withOpacity(1.0),
                offset: Offset(2,4),
                blurRadius: 4.0,
                spreadRadius: 3.0,
              ),
            ],

            //borderRadius: const BorderRadius.all(Radius.circular(8))
        ),

        child: Center(child: Text(input[position], style: TextStyle(color: Colors.black,fontSize: 0.1),)),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(

            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 3.0),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.shade100.withOpacity(1.0),
              offset: Offset(2,4),
              blurRadius: 4.0,
              spreadRadius: 3.0,
            ),
          ],

          //borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      );
    }
  }
  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,style: GoogleFonts.baiJamjuree(),),
          content: Text(msg,style: GoogleFonts.mali(fontWeight: FontWeight.bold),),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();

                

              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        image: const DecorationImage(
        image: const AssetImage("assets/images/bg001.jpeg"),
    fit: BoxFit.fill,
    ),
        ),
        child: SafeArea(
          //กำหนดไม่ให้ขึ้นไปเกินข้างบน

          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,//กำหนดไม่ให้ยืดเต็ม

                    children: [
                      Icon(Icons.lock_outline,size: 100.0,),
                      Text(
                        'LOGIN',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1, //ดึง style ตามที่เรากำหนดไว้มาใช้งาน
                      ),
                      Text('Enter PIN to login',style: GoogleFonts.mali(fontSize: 25.0,fontWeight: FontWeight.bold),),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0; i < input.length; i++)
                                Container(
                                  margin: EdgeInsets.all(4.0),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      shape: BoxShape.circle),
                                ),
                              for (var i = input.length; i < 6; i++)
                                Container(
                                  margin: EdgeInsets.all(4.0),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red
                                        .withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //จะยืดให้สุด และครอบด้วย center เพื่อให้มากึ่งกลาง
              Container(
                //พื้นที่ของปุ่ม
                // height: 200.0, //ความสูงของ container
                // color: Colors.pink,
                child: Column(
                  //เอาคอลัมน์มาครอบตรงพื้นที่ปุ่ม
                  children: [
                    [1, 2, 3], //เริ่มต้นลิสต์ที่มี 3 สมาชิก
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    //map ชั้นแรกแปลงลิสต์ไปเป็น row
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        //map ชั้น 2 map ไปเป็นปุ่ม
                        return Padding(
                          //เอา padding มาครอบปุ่มเพื่อสร้างพื้นที่ว่างรอบๆปุ่ม
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList(), //แปลงจากลิสต์จำนวนเต็มเป็นลิสต์ button
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButton(int num) {
    print('hello $num'); //พอ user กดปุ่มก็จะปริ้นท์เลขออกมา
    setState(() {

      if(num ==-1){
        if(input.length>0)
        input = input.substring(0,input.length-1);//เป็นการลบตัวเลขก่อนหน้า
      }else {

        input = '$input$num'; //เป็นการต่อตัวเลขที่กดเข้ามาว่ากดอะไรเข้ามาบ้าง
        if(input==password){
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => HomePage()),
          // );
          Navigator.pushReplacementNamed(context, HomePage.routeName);//การ navigate โดยใช้ name root

        }else if(input.length==6){
           _showMaterialDialog('ERROR','Invalid PIN.Please try again.');
           input = '';
        }

      }
    });

  }
}

class LoginButton extends StatelessWidget {
  final int number; //กำหนดตัวเลขในปุ่ม
  final Function(int) onClick; //ฟังก์ชันที่จะให้ทำเมื่อปุ่มถูกกด
  const LoginButton({
    required this.number, //required คือ บังคับว่าต้องส่งค่าเข้ามา
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //ใส่วิตเจ็ตให้กดได้เหมือนปุ่ม
      customBorder: CircleBorder(), //กำหนดให้พื้นที่กดปุ่มอยู่ในแต่วงกลม
      onTap:  number == -2 ? null : () => onClick(number),//เวลากดแล้วเรียกไปที่ฟังก์ชัน onClick
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2 ? null : BoxDecoration(//ถ้าเลขเป็น -2 จะไม่มี border
          shape: BoxShape.circle, //กำหนดเส้นปุ่มให้เป็นวงกลม
          border: Border.all(width: 4.0), //กำหนดขนาดเส้น
          color: Colors.purple.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(1.0),
              offset: Offset(2,4),
              blurRadius: 4.0,
              spreadRadius: 3.0,
            ),
          ],

        ),
        child: Center(
          child: number >=0 ? Text(
            '$number',
            style: Theme
                .of(context)
                .textTheme
                .headline6,
          ) : (number==-1 ? Icon(Icons.backspace_outlined) : SizedBox.shrink()), //จะไม่ส่งค่า text ถ้าเป็นค่าลบ
        ),
      ),
    );
  }
}

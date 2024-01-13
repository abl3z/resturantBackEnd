import 'package:flutter/material.dart';

void main() {
  runApp(
    about(),
  );
}

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.amber,
          appBar: AppBar(
            toolbarHeight: 65,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
                ;
              },
            ),
            backgroundColor: Color.fromRGBO(23, 70, 162, 1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "shahemPic/shahemLogo.jpg",
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "About Shahem",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 247, 233, 1),
                      fontFamily: 'Pacifico',
                      fontSize: 30),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "شهم إبن اخوي. بعتبرو زي ابني وبحبو وبحبني لدرجة انو أول ما يشوفني بكفكفني وبعضني وبسكر الباب بوجهي ''انو ع بلاطة بعمل كل اشي الا انو يحبني''. حبيت اقدم الأبلكيشن ع اسمو عشان شهم بعنيلي كل إشي . بحبك شهوم …   من عمو صالح❤️",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(
                        'shahemPic/shahem1.jpg',
                      ),
                      height: 200,
                      width: 200,
                    ),
                    Image(
                      image: AssetImage('shahemPic/shahem7.jpg'),
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(
                        'shahemPic/shahem3.jpg',
                      ),
                      height: 200,
                      width: 200,
                    ),
                    Image(
                      image: AssetImage('shahemPic/shahem4.jpg'),
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(
                        'shahemPic/shahem5.jpg',
                      ),
                      height: 200,
                      width: 200,
                    ),
                    Image(
                      image: AssetImage('shahemPic/shahem6.jpg'),
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(
                        'shahemPic/shahem2.jpg',
                      ),
                      height: 200,
                      width: 200,
                    ),
                    Image(
                      image: AssetImage('shahemPic/shahem10.jpg'),
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

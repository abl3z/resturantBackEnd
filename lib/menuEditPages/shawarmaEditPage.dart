import 'package:flutter/material.dart';
import '../mainPages/profile.dart';
import 'package:resBackEnd/MenuPages/shawarmaMenu.dart';
import 'package:resBackEnd/mainPages/address1.dart';

void main() {
  runApp(shawarmaEdit());
}

double pagePrice = 0;

class shawarmaEdit extends StatelessWidget {
  const shawarmaEdit({this.shawarmaID, this.totalofAll, super.key});
  final int? shawarmaID;
  final double? totalofAll;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EB(
        shawarmaID: shawarmaID!,
        totalofAll: totalofAll!,
      ),
    );
  }
}

class EB extends StatefulWidget {
  EB({super.key, required this.shawarmaID, required this.totalofAll});

  final int shawarmaID;
  double totalofAll;

  @override
  State<EB> createState() => _EBState();
}

class _EBState extends State<EB> {
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;
  int count7 = 0;
  int count8 = 0;
  int count9 = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 247, 233, 1),
        appBar: AppBar(
          toolbarHeight: 65,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(255, 247, 233, 1),
              size: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => shawarmaMenu()),
              );
            },
          ),
          backgroundColor: Color.fromRGBO(23, 70, 162, 1),
          title: Row(),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Address(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: Color.fromRGBO(255, 247, 233, 1),
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              displayShawarmaImage(widget.shawarmaID),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Extra:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: [
                  edit("assets/editInfo/shawarmaSlice1.jpg", "Shawarma Slices",
                      "1.50"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count1 > 0) {
                            widget.totalofAll -= 1.5;
                            count1--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count1.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count1 < 3) {
                            widget.totalofAll += 1.5;
                            count1++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/mash.jpg", "Mushroom", "0.50"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count2 > 0) {
                            widget.totalofAll -= 0.5;
                            count2--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count2.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count2 < 3) {
                            widget.totalofAll += 0.5;
                            count2++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/spice.jpg", "Chili", "0.50"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count2 > 0) {
                            widget.totalofAll -= 0.5;
                            count2--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count2.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count2 < 3) {
                            widget.totalofAll += 0.5;
                            count2++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/pickles.jpg", "Pickles", "0.75"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count3 > 0) {
                            widget.totalofAll -= 0.75;
                            count3--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count3.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count3 < 3) {
                            widget.totalofAll += 0.75;
                            count3++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/cheese.jpg", "Cheddar cheese", "1.00"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count4 > 0) {
                            widget.totalofAll -= 1.0;
                            count4--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count4.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count4 < 3) {
                            widget.totalofAll += 1.0;
                            count4++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/onion.jpg", "Onion", "0.50"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count5 > 0) {
                            widget.totalofAll -= 0.5;
                            count5--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count5.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count5 < 3) {
                            widget.totalofAll += 0.5;
                            count5++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/tomato.jpg", "Tomato Slice", "0.50"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count6 > 0) {
                            widget.totalofAll -= 0.5;
                            count6--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count6.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count6 < 3) {
                            widget.totalofAll += 0.5;
                            count6++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/mayo.jpg", "Mayo", "0.75"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count7 > 0) {
                            widget.totalofAll -= 0.75;
                            count7--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count7.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count7 < 3) {
                            widget.totalofAll += 0.75;
                            count7++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/kat.jpg", "Ketchup", "0.75"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count8 > 0) {
                            widget.totalofAll -= 0.75;
                            count8--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count8.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count8 < 3) {
                            widget.totalofAll += 0.75;
                            count8++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                children: [
                  edit("assets/editInfo/spiceMayo.jpg", "Spicy Mayo", "0.75"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count9 > 0) {
                            widget.totalofAll -= 0.75;
                            count9--;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.remove),
                  ),
                  Text(count9.toString()),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        CircleBorder(
                          side: BorderSide(width: 3),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (count9 < 3) {
                            widget.totalofAll += 0.75;
                            count9++;
                            print(widget.totalofAll);
                          }
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Container(
                alignment: AlignmentDirectional.bottomStart,
                width: double.infinity,
                height: 50,
                color: Color.fromRGBO(23, 70, 162, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total: ${widget.totalofAll}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: Container(
                            height: 46,
                            width: 2.5,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => shawarmaMenu(),
                              ),
                            );
                          },
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget displayShawarmaImage(int shawarmaID) {
    switch (shawarmaID) {
      case 1:
        return Image.asset('assets/shawarmaPictures/chis.jpg');
      case 2:
        return Image.asset('assets/shawarmaPictures/befs.jpg');
      case 3:
        return Image.asset('assets/shawarmaPictures/dcs.jpg');
      case 4:
        return Image.asset('assets/shawarmaPictures/dbs.jpg');
      case 5:
        return Image.asset('assets/shawarmaPictures/fs.jpg');
      default:
        return const Text('Invalid shawarmas number');
    }
  }
}

Widget edit(String imagetxt, String infotxt, String price) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage(imagetxt),
          width: 70,
          height: 70,
          alignment: Alignment.centerLeft,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              infotxt,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4.0,
              child: Container(
                color: Colors.black,
              ),
            ),
            Text("Price: $price\$"),
          ],
        ),
      ],
    ),
  );
}

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '/editPages/edit_profile.dart';
import '/information.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  runApp(
    profilePage(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PP(),
    );
  }
}

class PP extends StatefulWidget {
  const PP({super.key});

  @override
  State<PP> createState() => _ppState();
}

class _ppState extends State<PP> {
  // String updateFullName() {
  //   setState(() {
  //     return User.setFullName(User.getFullName());
  //   });
  //   return '';
  // }

  UserDetails? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    FirebaseService fbs = FirebaseService();
    UserDetails? temUser =
        await fbs.getUserDetails(Auth().auth.currentUser!.uid);
    if (temUser == null) {
      print("user is not check your code");
    } else {
      setState(() {
        user = temUser;
      });
    }
  }

  Future<void> fetchpizzaData() async {
    String userid = Auth().auth.currentUser!.uid;
    UserDetails? usr = await FirebaseService().getUserDetails(userid);
    if (usr != null) {
      setState(() {
        user = usr;
      });
    } else {
      print("user not available");
    }
  }

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
              Navigator.pop(context);
              ;
            },
          ),
          backgroundColor: Color.fromRGBO(23, 70, 162, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                size: 38,
                color: Colors.amber,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Profile Account",
                style: TextStyle(
                    color: Color.fromRGBO(255, 247, 233, 1),
                    fontFamily: 'Pacifico',
                    fontSize: 30),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user!.photo),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 37,
                ),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 37,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return pp(user!.name);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 37,
                ),
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 37,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: pp(User1.getGender()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 37,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 37,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: pp(user!.email),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 37,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 37,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: pp(User1.getPhoneNumber()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 37,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => editProfile(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return AddCat();
                    }));
                  },
                  child: Text("Add category to db"),
                ),
                ElevatedButton(
                  onPressed: () {
                    addtoDB();
                  },
                  child: Text("Add products to db"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addtoDB() {
    final DatabaseReference dataRef =
        FirebaseDatabase.instance.ref().child("Category/Products");
    for (int i = 0; i < photo().Urls.length; ++i) {
      proDetails pro =
          proDetails(photoName: photo().names[i], photoUrl: photo().Urls[i]);
      dataRef.push().set(pro.toMap()).then((value) {
        print("products details add to DB");
      });
    }
  }
}

Widget pp(String labelText) {
  return Container(
    margin: EdgeInsets.only(top: 10), // Add some spacing above the border
    padding: EdgeInsets.symmetric(
        horizontal: 10), // Add padding inside the container
    /*decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2, color: Colors.black),
      ),
    ),*/
    child: Text(
      labelText,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.start,
    ),
  );
}

// Widget exit() {
//   return ;
// }
class AddCat extends StatefulWidget {
  const AddCat({super.key});

  @override
  State<AddCat> createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add category"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _img == null
              ? Center(
                  child: IconButton(
                      onPressed: () {
                        pickAnImage();
                      },
                      icon: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.amber,
                      )))
              : Center(
                  child: IconButton(
                      onPressed: () {
                        pickAnImage();
                      },
                      icon: CircleAvatar(
                        backgroundImage: MemoryImage(_img!.files.first.bytes!),
                        radius: 70,
                      )),
                ),
          ElevatedButton(
              onPressed: () {
                handleaddcategory("cat");
              },
              child: Text("add now"))
        ],
      ),
    );
  }

  Future<void> handleaddcategory(String cat) async {
    final DatabaseReference refCat =
        FirebaseDatabase.instance.ref().child("Category");
    final Reference catSorageRef = FirebaseStorage.instance
        .ref()
        .child("categoryImages/${DateTime.now().millisecondsSinceEpoch}.jpg");
    UploadTask uploadTask = catSorageRef.putData(_img!.files.first.bytes!);
    String imgurl = await (await uploadTask).ref.getDownloadURL();
    Map<dynamic, dynamic> catMap = {"catName": cat, "imgURL": imgurl};
    refCat.push().set(catMap).whenComplete(() {
      print("user added to database");
    });
  }

  FilePickerResult? _img;
  Future<void> pickAnImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) {
      return null;
    } else {
      setState(() {
        _img = result;
      });
    }
  }
}

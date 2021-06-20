import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namaste/models/product.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/models/waste.dart';
import 'package:namaste/navbar.dart';
import 'package:namaste/pages/scheduleConfirm.dart';
import 'package:namaste/providers/user_provider.dart';
import 'package:provider/provider.dart';

class WasteForm extends StatefulWidget {
  const WasteForm({Key? key}) : super(key: key);

  @override
  _WasteFormState createState() => _WasteFormState();
}

class _WasteFormState extends State<WasteForm> {
  var _formKey = GlobalKey<FormState>();
  WasteData wasteData = WasteData();
  var nameController = TextEditingController();
  var pinController = TextEditingController();

  var locationController = '';
  var timeController = "";
  var typeController = "";
bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    
 UserData userData= Provider.of<UserProvider>(context, listen: false).userData;
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu, color: Colors.grey),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: NavBar(),
        body:  Center(
            child: isLoading?CircularProgressIndicator():Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text("SCHEDULE YOUR PICK UP",
                            style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left),
                        SizedBox(height: 20),
                        Text("Fill in your details in the form below",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400)),
                        SizedBox(height: 50),
                        TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Your name',
                          ),
                          controller: nameController,
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            items: [
                              DropdownMenuItem<String>(
                                child: Text('Idukki'),
                                value: 'Idukki',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Palakkad'),
                                value: 'Palakkad',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Pathanamthitta'),
                                value: 'Pathanamthitta',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Malappuram'),
                                value: 'Malappuram',
                              ),
                            ],
                            hint: locationController == ''
                                ? Text('Select Location')
                                : Text(locationController.toString()),
                            onChanged: (String? newValue) {
                              setState(() {
                                locationController = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Pincode',
                          ),
                          keyboardType: TextInputType.number,
                          controller: pinController,
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            items: [
                              DropdownMenuItem<String>(
                                child: Text('9-10'),
                                value: '9-10',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('12-2'),
                                value: '12-2',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('4-6'),
                                value: '4-6',
                              ),
                            ],
                            hint: timeController == ''
                                ? Text('Choose your pick up schedule')
                                : Text(timeController.toString()),
                            onChanged: (String? newValue) {
                              setState(() {
                                timeController = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            items: [
                              DropdownMenuItem<String>(
                                child: Text('Plastic waste'),
                                value: 'Plastic Waste',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Bio-waste'),
                                value: 'Bio Waste',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Electronic waste'),
                                value: 'Electronic Waste',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Agricultural waste'),
                                value: 'Agricultural Waste',
                              ),
                            ],
                            hint: typeController == ''
                                ? Text('Category of waste')
                                : Text(typeController.toString()),
                            onChanged: (String? newValue) {
                              setState(() {
                                typeController = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                      
                          InkWell(
                                onTap: () async {
                                  print('Called');
                                    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
                                  setState(() {
                                    isLoading=true;
                                  });
                                  _formKey.currentState!.save();
                                  wasteData = WasteData(
                                      uid: userData.uid,
                                      name: nameController.text,
                                      type: typeController,
                                      phone: userData.phone,
                                      pincode: pinController.text,
                                      weight: "0",
                                      ward: "N/A");
                                  await Provider.of<UserProvider>(context,
                                          listen: false)
                                      .addWaste(wasteData: wasteData);
                                      await Provider.of<UserProvider>(context,
                                          listen: false)
                                      .addPoints(id:uid,points: 5);
                                      setState(() {
                                        isLoading=false;
                                      });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScheduleConfirmation()));
                                },
                                child: Container(
                                 
                            alignment: Alignment(0, 0),
                       
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                                  child: Text(
                                    
                                    "SUBMIT",
                                    style: TextStyle(color: Colors.green[900]),
                                  ),
                                )),
                        SizedBox(height: 40),
                        Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment(0, 0),
                            color: Colors.green[100],
                            child: Text(
                                "You can also drop it off at your nearest disposal centre ---->"))
                      ],
                    ),
                  ),
                ))));
  }

}
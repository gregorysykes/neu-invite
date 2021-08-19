import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget avatar() {
    return Container(
      child: NeumorphicButton(
        onPressed: () {},
        padding: EdgeInsets.all(5),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.concave,
          // border: NeumorphicBorder(color: Colors.grey[700], width: 10)
        ),
        child: NeumorphicIcon(
          Icons.account_circle_outlined,
          size: 160,
          style: NeumorphicStyle(color: Colors.indigo, depth: 10),
        ),
      ),
    );
  }

  Widget accInfo(
      {String full_name = 'Gregory Sykes',
      String ksei = 'ksei',
      String sid = '000000',
      String user_id = 'sykes01',
      String id_type = 'ktp',
      String id_no = '333333333333',
      String rdn_bank = 'bca',
      String rdn_no = '6041340662'}) {
    return Container(
        child: Column(
      children: [
        NeumorphicText(
          full_name,
          textStyle:
              NeumorphicTextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          style: NeumorphicStyle(color: Colors.black54),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Neumorphic(
          style: NeumorphicStyle(
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'KSEI A/C Info',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('SID',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    ksei,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(
                    sid,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'User ID',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(child: Container())
                ],
              ),
              Row(
                children: [
                  Text(
                    user_id,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(child: Container())
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'ID Type',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('ID Number',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    id_type,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(id_no,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'RDN Bank',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('RDN Number',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    rdn_bank,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(rdn_no,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget bankInfo(
      {String bank_code = 'BCA',
      String acc_name = 'Gregory Sykes',
      String branch = 'alsut',
      String opening_date = '04/01/2017'}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bank Info',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Neumorphic(
          style: NeumorphicStyle(
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Bank Code',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Account Name',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    bank_code,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(acc_name,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'Branch',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Opening Date',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    branch,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(opening_date,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget personalInfo(
      {String nationality = 'Indonesia',
      String company = 'IN',
      String email = 'tcool2803@gmail.com',
      String mobile = '081584277095',
      String home_address = 'rumah impian',
      String company_address = 'kantor kesayangan'}) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Info',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Neumorphic(
          style: NeumorphicStyle(
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Nationality',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Company',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    nationality,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(
                    company,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'E-Mail',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                    child: Text(
                      'Mobile',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.black45, fontStyle: FontStyle.italic),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    email,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Text(mobile,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.end),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'Home Address',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Company Address',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    home_address,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(company_address,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NeumorphicAppBar(
              title: NeumorphicText(
                'Profile',
                style: NeumorphicStyle(
                  depth: 5,
                  color: Colors.indigo,
                ),
                textStyle: NeumorphicTextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              buttonStyle: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 5,
                  color: Colors.grey[350]),
              iconTheme: IconThemeData(
                color: Colors.black45,
                size: 18,
              ),
              buttonPadding: EdgeInsets.all(0),
              actions: [],
            ),
            preferredSize: Size.fromHeight(80.0)),
        body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              avatar(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              accInfo(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              bankInfo(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              personalInfo()
            ],
          ),
        ));
  }
}

avatar() {}

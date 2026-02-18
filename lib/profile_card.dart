import 'package:flutter/material.dart';
import 'package:responsive_design/login_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Design'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 800),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row( //wide layout
                  children: [
                    _buildAvatar(),
                    SizedBox(height: 20),
                    Expanded(child: _buildContent(context),),
                  ],
                );
              } 
              else { //narrow layout
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAvatar(),
                    SizedBox(height: 20),
                    _buildContent(context),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

//function that returns a Widget
Widget _buildAvatar() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      shape: BoxShape.circle,
    ),

    child: Icon(Icons.person, size: 50, color: Colors.white),
  );
}

Widget _buildContent(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start, //left justifies
    children: [
      Text(
        'Pointdexter Dankworth',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Text('Major: Computer Science'),
      Text('Favorite class: CS220'),
      SizedBox(height: 20),
      ElevatedButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen())
        );
      }, child: Text('Login in')),
    ],
  );
}

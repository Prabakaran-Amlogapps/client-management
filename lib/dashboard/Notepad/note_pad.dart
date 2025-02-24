import 'package:employee_client_management/dashboard/Notepad/notepad_backend_functions/screens/notepade_list.dart';
import 'package:flutter/material.dart';

class NotePad_1 extends StatefulWidget {
  const NotePad_1({super.key});

  @override
  State<NotePad_1> createState() => _NotePad_1State();
}

class _NotePad_1State extends State<NotePad_1> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 14),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "LexendDecaRegular",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Spacer(), // To push the icon to the right
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteListScreen()));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
            Container(
              // margin: EdgeInsets.only(bottom: 10),
              child: Divider(
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Text(
                  "Payment Pending",
                  style: TextStyle(
                    fontFamily: "LexendDecaRegular",
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Checkbox(
                  fillColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 75, 145, 175)),
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

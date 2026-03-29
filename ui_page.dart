import 'package:flutter/material.dart';

class UIPage extends StatefulWidget {
  @override
  _UIPageState createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {

  // 🔹 VARIABLES
  TextEditingController controller = TextEditingController();
  bool checkboxValue = false;
  bool switchValue = false;
  double sliderValue = 20;
  String dropdownValue = "Option 1";
  String result = "";

  void showResult() {
    setState(() {
      result =
          "Text: ${controller.text}\n"
          "Checkbox: $checkboxValue\n"
          "Switch: $switchValue\n"
          "Slider: ${sliderValue.toInt()}\n"
          "Dropdown: $dropdownValue";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Controls"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 TEXTFIELD
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Enter Text"),
            ),

            SizedBox(height: 10),

            // 🔹 CHECKBOX
            CheckboxListTile(
              title: Text("Checkbox"),
              value: checkboxValue,
              onChanged: (val) {
                setState(() {
                  checkboxValue = val!;
                });
              },
            ),

            // 🔹 SWITCH
            SwitchListTile(
              title: Text("Switch"),
              value: switchValue,
              onChanged: (val) {
                setState(() {
                  switchValue = val;
                });
              },
            ),

            // 🔹 SLIDER
            Text("Slider: ${sliderValue.toInt()}"),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (val) {
                setState(() {
                  sliderValue = val;
                });
              },
            ),

            // 🔹 DROPDOWN
            DropdownButton<String>(
              value: dropdownValue,
              items: ["Option 1", "Option 2", "Option 3"]
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  dropdownValue = val!;
                });
              },
            ),

            SizedBox(height: 20),

            // 🔹 BUTTON
            ElevatedButton(
              onPressed: showResult,
              child: Text("Show Result"),
            ),

            SizedBox(height: 20),

            // 🔹 OUTPUT
            Text(result),

          ],
        ),
      ),
    );
  }
}

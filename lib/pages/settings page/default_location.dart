import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/providers/general_settings_provider.dart';

class DefaultLocation extends StatefulWidget {
  const DefaultLocation({super.key});

  @override
  State<DefaultLocation> createState() => _DefaultLocationState();
}

class _DefaultLocationState extends State<DefaultLocation> {
  TextEditingController _textEditingController = TextEditingController();

  void _showDialog(String location, GeneralSettings generalSettings) {
    _textEditingController.text = location;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Set default location',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[200]),
          ),
          backgroundColor: Colors.black,
          content: TextField(
            controller: _textEditingController,
            style: TextStyle(color: Colors.grey[200]),
            cursorColor: Colors.grey[800],
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintText: "Default location",
              hintStyle: TextStyle(color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.black,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade900,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade500,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.0.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey[200], fontSize: 16.sp),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_textEditingController.text.isNotEmpty) {
                  generalSettings.setLocation(_textEditingController.text);
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(
                'set',
                style: TextStyle(color: Colors.grey[200], fontSize: 16.sp),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GeneralSettings generalSettings = Provider.of<GeneralSettings>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Default Location',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 22.sp,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Card(
          color: Colors.grey[900],
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  generalSettings.defaultLocation ?? 'No default location',
                  style: TextStyle(color: Colors.grey[300], fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[200],
                  ),
                  child: const Text('Set'),
                  onPressed: () {
                    _showDialog(generalSettings.defaultLocation ?? 'No default location', generalSettings);
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

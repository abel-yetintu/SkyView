import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_view/pages/search%20page/recent_location_card.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              style: TextStyle(color: Colors.grey[200]),
              cursorColor: Colors.grey[800],
              controller: _textInputController,
              decoration: InputDecoration(
                  hintText: "Enter location..",
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {
                      setState(() {  
                        _textInputController.clear();
                      });
                    },
                  )),
              onChanged: (value) {
                setState(() {
                  _textInputController.text = value;
                });
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            if (_textInputController.text.isEmpty) ...[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent locations',
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const RecentLocationCard();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ] else if (_textInputController.text.isNotEmpty)
              ...[]
          ],
        ),
      ),
    );
  }
}
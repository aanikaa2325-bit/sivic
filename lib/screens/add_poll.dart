import 'package:flutter/material.dart';
import 'package:sivic/screens/add_complaint.dart';
import 'package:dotted_border/dotted_border.dart';


class AddPoll extends StatefulWidget {
  const AddPoll({super.key});

  @override
  State<AddPoll> createState() => _AddPollState();
}

class _AddPollState extends State<AddPoll> {

  bool _addOption = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icons/back.png',
            height: 48,
            width: 48,
          ),
          padding: const EdgeInsets.only(left: 16),
        ),
        title: const Text('Create poll',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E241E),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333733),
                      ),
                      cursorColor: Color(0xFF276F27),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        isDense: true,

                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,

                        hintText: 'What do you want to ask?',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFBEC4BE),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value==null || value.isEmpty) return 'Title cannot be empty.';
                      return null;
                    },
                    cursorColor: Color(0xFF4A8B4A),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Option 1',
                    ),
                  ),
                  SizedBox(height: 6),
                  TextFormField(
                    validator: (value) {
                      if (value==null || value.isEmpty) return 'Title cannot be empty.';
                      return null;
                    },
                    cursorColor: Color(0xFF4A8B4A),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Option 2',
                    ),
                  ),
                  SizedBox(height: 6),
                  DottedBorder(
                    options: const RoundedRectDottedBorderOptions(
                      color: Color(0xFFDFE6DF),
                      strokeWidth: 2,
                      dashPattern: [8, 8],
                      radius: Radius.circular(18),
                    ),
                    child: SizedBox(
                      height: 48,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/icons/add_faded.png'), height: 20, width: 20),
                            SizedBox(width: 8),
                            Text('Add an option',
                              style: TextStyle(
                                color: Color(0xFFB8BEB8),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

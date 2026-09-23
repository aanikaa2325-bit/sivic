import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sivic/navigation_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddComplaint extends StatefulWidget {
  const AddComplaint({super.key});

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();
  int selectedIndex = 0;
  bool _isUploading = false;


  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<List<String>> uploadImagesToCloudinary() async {
    const String cloudName = 'jlubwqsd';
    const String uploadPreset = 'sivic_uploads';

    List<String> uploadedUrls = [];

    for (File image in _selectedImages) {
      try {
        final uri = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
        final request = http.MultipartRequest('POST', uri);

        request.fields['upload_preset'] = uploadPreset;
        request.fields['folder'] = 'complaints';

        request.files.add(
          await http.MultipartFile.fromPath('file', image.path),
        );

        final response = await request.send();
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseBody);

        if (response.statusCode == 200) {
          final String imageUrl = jsonResponse['secure_url'];
          uploadedUrls.add(imageUrl);
          debugPrint('Uploaded successfully: $imageUrl');
        } else {
          debugPrint('Cloudinary Error: ${jsonResponse['error']['message']}');
        }
      } catch (e) {
        debugPrint('Upload failed: $e');
      }
    }

    return uploadedUrls;
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        imageQuality: 80,
      );
      if (pickedFiles.isNotEmpty) {
        setState(() {
          _selectedImages.addAll(pickedFiles.map((x) => File(x.path)));
        });
      }
    } catch (e) {
      debugPrint("Error picking images: $e");
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    setState(() => _isUploading = true);

    try {
      List<String> uploadedImageUrls = [];
      if (_selectedImages.isNotEmpty) {
        uploadedImageUrls = await uploadImagesToCloudinary();
      }

      List<String> categories = ['General', 'Infrastructure', 'Utilities & Power', 'Sanitation/Waste'];
      String selectedCategory = categories[selectedIndex];

      final user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance.collection('complaints').add({
        'title': _titleController.text.trim(),
        'description': _descriptionController.text.trim(),
        'location': _locationController.text.trim(),
        'category': selectedCategory,
        'imageUrls': uploadedImageUrls, // Cloudinary URLs
        'userId': user?.uid ?? 'anonymous',
        'status': 'Pending',
        'createdAt': FieldValue.serverTimestamp(),
        'voteCount' : 0,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Complaint submitted successfully!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavigationMenu()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isUploading = false);
    }
  }

  Widget complaintContainer(
      int index,
      String iconPath,
      String text,
      ) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? Color(0xFFC0F686)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? Color(0xFFBDE394)
                  : Color(0xFFDFE6DF),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                iconPath,
                width: 20,
                height: 20,
              ),

              const SizedBox(width: 8),

              Text(
                text,
                style: TextStyle(
                  color: Color(0xFF333733),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('New complaint',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E241E),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    'Submit details to alert your local government about an issue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF848D84),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        'Issue category',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333733),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(child: complaintContainer(0, 'assets/icons/general.png', 'General',)),
                            SizedBox(width: 4),
                            Expanded(child: complaintContainer(1, 'assets/icons/infrastructure.png', 'Infrastructure',)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(child: complaintContainer(2, 'assets/icons/power.png', 'Utilities & Power',)),
                            SizedBox(width: 4),
                            Expanded(child: complaintContainer(3, 'assets/icons/waste.png', 'Sanitation/Waste',)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        'Complaint title',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333733),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value==null || value.isEmpty) return 'Title cannot be empty.';
                            return null;
                          },
                          controller: _titleController,
                          cursorColor: Color(0xFF4A8B4A),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Complaint title',
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            'Details and description',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF333733),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    SizedBox(
                      height: 112,
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.top,
                        cursorColor: Color(0xFF4A8B4A),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Tell more about your complaint...',
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333733),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 136,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage('assets/images/demo_map.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image (image:
                              AssetImage('assets/icons/location_pin_alt.png'),
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 6),
                              Text('Tap to set a pin',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF474F47),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Location must be attached with complaint';
                        return null;
                      },
                      controller: _locationController,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset('assets/icons/location_map.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        hintText: 'Search for address or landmark',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        'Add photo reference',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333733),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: _pickImages,
                      behavior: HitTestBehavior.opaque,
                      child: DottedBorder(
                        options: const RoundedRectDottedBorderOptions(
                          color: Color(0xFFDFE6DF),
                          strokeWidth: 2,
                          dashPattern: [8, 8],
                          radius: Radius.circular(16),
                        ),
                        child: SizedBox(
                          height: 128,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/icons/camera.png'), height: 20, width: 20),
                              Text('Upload photo', style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333733),
                              ),
                              ),
                              Text('JPEG on PNG up to 50 MB', style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF848D84),
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_selectedImages.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 90,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _selectedImages.length,
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: const Color(0xFFDFE6DF)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      _selectedImages[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () => _removeImage(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                    SizedBox(height: 40),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5FBF0),
                            border: Border.all(
                              color: Color(0xFFC4E0A6),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18, left: 16, right: 16, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image (image: AssetImage('assets/icons/info.png'), height: 20, width: 20,),
                                    SizedBox(width: 8),
                                    Text('Automatic Fiscal Tracking', style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF333733),
                                      height: 1.2,
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text('Once reported, this ticket links to our live civic ledger. Citizens can monitor approved allocations and exact expenditure reports.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF848D84),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 56,
                          child: InkWell(
                            onTap: _isUploading ? null : _submit, // <-- Points to the combined _submit method
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _isUploading ? Colors.grey : const Color(0xFF1C1F1C),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: _isUploading
                                    ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                                    : const Text(
                                  'Submit complaint',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

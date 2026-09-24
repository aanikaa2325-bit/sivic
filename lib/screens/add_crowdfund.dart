import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sivic/navigation_menu.dart';


class AddCrowdfund extends StatefulWidget {
  const AddCrowdfund({super.key});

  @override
  State<AddCrowdfund> createState() => _AddCrowdfundState();
}

class _AddCrowdfundState extends State<AddCrowdfund> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _locationController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  Future<void> _submitProject() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    setState(() => _isUploading = true);

    try {
      List<String> uploadedImageUrls = [];

      if (_selectedImages.isNotEmpty) {
        uploadedImageUrls = await uploadImagesToCloudinary();
      }

      final user = FirebaseAuth.instance.currentUser;
      String userId = user?.uid ?? 'anonymous_user';

      await FirebaseFirestore.instance.collection('crowdfund_projects').add({
        'title': _titleController.text.trim(),
        'description': _descController.text.trim(),
        'location': _locationController.text.trim(),
        'goal': double.tryParse(_goalController.text.trim()) ?? 0.0,
        'raised': 0.0,
        'imageUrls': uploadedImageUrls,
        'creatorId': userId,
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'active',
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Project created successfully!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavigationMenu()),
        );
      }
    } catch (e) {
      debugPrint("Upload Error: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating project: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  Future<List<String>> uploadImagesToCloudinary() async {
    const String cloudName = 'jlubwqsd';
    const String uploadPreset = 'sivic_uploads';

    List<String> uploadedUrls = [];

    for (File image in _selectedImages) {
      try {
        final uri = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
        final request = http.MultipartRequest('POST', uri);

        request.fields['upload_preset'] = uploadPreset;
        request.fields['folder'] = 'crowdfund';

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
        title: const Text('New Crowdfund Project',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E241E),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Project title',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333733),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _titleController,
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
                      hintText: 'Project title',
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Project Description',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333733),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 112,
                    child: TextFormField(
                      controller: _descController,
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
                        hintText: 'Add project description',
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Add image (optional)',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333733),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
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
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333733),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _locationController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Location must be attached with project';
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/icons/location_map.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      hintText: 'Enter project location',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Goal',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333733),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _goalController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Amount field cannot be empty';
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/icons/taka.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      hintText: 'Enter goal amount',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 48),
                  SizedBox(
                    height: 56,
                    child: InkWell(
                      onTap: _submitProject,
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
                            'Create crowdfund project',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

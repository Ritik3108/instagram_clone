import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
pickImage(ImageSource source)async
{final ImagePicker _imagePicker=ImagePicker();
XFile file=await _imagePicker.pickImage(source: source);

if(file!=null)
{
 return await file.readAsBytes();
}print("object");


}

showSnackBar(String content,BuildContext context)
{

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content),));

}
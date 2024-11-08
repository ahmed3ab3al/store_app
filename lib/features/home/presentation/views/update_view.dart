import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_form_field.dart';
import 'package:store_app/features/home/presentation/view_models/cubit/cubit.dart';
import '../../data/models/all_product.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({super.key, required this.category,});
  final AllProductModel category;

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  final TextEditingController priceController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              CustomTextFormFiled(
                customController: nameController,
                cursorColor: Colors.blue,
                hint: 'Product Name',
                borderRadius: 14,
                borderColor: Colors.grey,
                enabledBorderColor: Colors.grey,
                focusedBorderColor: Colors.blue,
              ),
              SizedBox(height: 20),
              CustomTextFormFiled(
                cursorColor: Colors.blue,
                customController: descriptionController,
                hint: 'Product description',
                borderRadius: 14,
                borderColor: Colors.grey,
                enabledBorderColor: Colors.grey,
                focusedBorderColor: Colors.blue,
              ),
              SizedBox(height: 20),
              CustomTextFormFiled(
                cursorColor: Colors.blue,
                customController: priceController,
                type: TextInputType.number,
                hint: 'Product Price',
                borderRadius: 14,
                borderColor: Colors.grey,
                enabledBorderColor: Colors.grey,
                focusedBorderColor: Colors.blue,
              ),
              SizedBox(height: 20),
              CustomTextFormFiled(
                cursorColor: Colors.blue,
                customController: imageController,
                hint: 'Product Image',
                borderRadius: 14,
                borderColor: Colors.grey,
                enabledBorderColor: Colors.grey,
                focusedBorderColor: Colors.blue,
              ),
              SizedBox(height: 50),
              CustomButton(
                text: 'Update',
                onTap: ()async {
                  setState(() {
                    isLoading = true;
                  });
                await  StoreCubit.get(context).updateProduct(
                    title: nameController.text==null ? widget.category.title : nameController.text,
                    id: widget.category.id,
                    description: descriptionController.text==null ? widget.category.description : descriptionController.text,
                    price: priceController.text==null ? widget.category.price : priceController.text,
                    image: imageController.text==null ? widget.category.image : imageController.text,
                    category: widget.category.category,
                  );
                  setState(() {
                    isLoading = false;
                  });
                },
                containerHeight: 60,
                radius: 12,
                buttonColor: Colors.blue,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
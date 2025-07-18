part of '../index.dart';

class AddCategoryBody extends StatelessWidget {
  const AddCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryCubit = context.read<AddCategoryCubit>();
    return Builder(
      builder: (context) {
        final imageManager = context.read<ImageManagerCubit>();

        return SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonStateSuccess) {
                final snackBar = AppSnackBar.show(Text(state.dataSuccess));
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
                categoryCubit.titleController.clear();
                imageManager.clearImages();
              }
              if (state is ButtonStateFailure) {
                final snackBar = AppSnackBar.show(
                  Text(state.errMsg),
                  backgroundColor: AppColors.danger,
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            child: Form(
              key: categoryCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BuildHeaderCategory(),
                  SizedBox(height: 32),

                  TextFormFieldTitle(title: "Title Category"),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    controller: categoryCubit.titleController,
                    hintText: "Enter category title",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a category title';
                      }
                      if (value.trim().length < 2) {
                        return 'Title must be at least 2 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Image Upload Section
                  TextFormFieldTitle(title: 'Category Image'),
                  const SizedBox(height: 12),
                  PickImageSection(
                    imageListManager: categoryCubit.imageManager,
                  ),

                  SizedBox(height: 40),

                  BasicReactiveButton(
                    onPressed: () {
                      if (categoryCubit.formKey.currentState!.validate()) {
                        final images = context
                            .read<ImageManagerCubit>()
                            .state
                            .images;

                        if (images.isEmpty) {
                          showErrorDialog(
                            context,
                            "Please select an image for the category",
                          );
                          return;
                        }

                        context.read<ButtonCubit>().execute(
                          usecase: StoreCategoryUseCase(),
                          params: StoreCategoryRequest(
                            title: categoryCubit.titleController.text,
                            imageUrl: images.first,
                          ),
                        );
                      }
                    },
                    title: 'Create Category',
                    backgroundColor: Color(0xFF10B981),
                  ), // BasicAppButton(
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:global_expert/export.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPropertyController>(
      builder: (controller) => controller.images.isEmpty &&
              controller.networkImages.isEmpty
          ? Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: kcLightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _buildEmptyState(controller),
            )
          : _buildGallery(controller),
    );
  }

  Widget _buildEmptyState(AddPropertyController controller) {
    return Column(
      children: [
        Icon(
          Icons.image,
          size: 80,
          color: kcDarkGreyColor.withOpacity(0.5),
        ),
        verticalSpace(20),
        _buildAddButton(controller),
      ],
    );
  }

  Widget _buildGallery(AddPropertyController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              controller.updateSelectedImageIndex(index);
            },
          ),
          items: List.generate(
            controller.networkImages.length + controller.images.length,
            (index) {
              final isNetworkImage = index < controller.networkImages.length;
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: isNetworkImage
                              ? Image.network(
                                  controller.networkImages[index],
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  controller.images[
                                      index - controller.networkImages.length],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 10,
                      //   child: DotsIndicator(
                      //     dotsCount: controller.networkImages.length +
                      //         controller.images.length,
                      //     position: controller.selectedImageIndex,
                      //     decorator: DotsDecorator(
                      //       activeColor: kcPrimaryColor,
                      //       size: const Size.square(8.0),
                      //       activeSize: const Size(10.0, 10.0),
                      //       activeShape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(5.0),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  );
                },
              );
            },
          ),
        ),
        verticalSpace(10),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            ...List.generate(
              controller.networkImages.length + controller.images.length,
              (index) {
                final isNetworkImage = index < controller.networkImages.length;
                return Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 5),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => controller.updateSelectedImageIndex(index),
                        child: Container(
                          decoration: BoxDecoration(
                            border: controller.selectedImageIndex == index
                                ? Border.all(color: kcPrimaryColor, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: isNetworkImage
                                ? Image.network(
                                    controller.networkImages[index],
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    controller.images[index -
                                        controller.networkImages.length],
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: GestureDetector(
                          onTap: () => controller.deleteImage(index),
                          child: const Icon(
                            Icons.delete_outline,
                            size: 16,
                            color: kcRedColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () => controller.getImages(),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: kcLightGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.add,
                  color: kcTextGrey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddButton(AddPropertyController controller) {
    return GestureDetector(
      onTap: () => controller.getImages(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: kcPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add),
            horizontalSpace(10),
            Text(
              'Add Images',
              style: getMediumStyle(
                color: kcWhitecolor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

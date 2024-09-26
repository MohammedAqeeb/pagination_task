import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:pagination_task/features/display_animals/data/models/breeds.dart';

class PreviewViewListWidget extends StatelessWidget {
  final AnimalBreeds animalBreeds;
  const PreviewViewListWidget({
    super.key,
    required this.animalBreeds,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 13,
        right: 13,
        top: 6,
        bottom: 20,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 370,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageCard(context),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animalBreeds.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(25, 29, 35, 1),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          animalBreeds.temperament,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(105, 105, 105, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    animalBreeds.lifeSpan,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(105, 105, 105, 1),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 8),
              child: Divider(
                color: Colors.grey,
                thickness: 0.9,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weight: ${animalBreeds.weight.imperial} Kg',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(25, 29, 35, 1),
                    ),
                  ),
                  Text(
                    'View Info',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.purple.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 245,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                'https://cdn2.thedogapi.com/images/${animalBreeds.referenceImageId}.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.favorite_border,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

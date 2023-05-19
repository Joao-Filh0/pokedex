import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';

class PokedexCardComponent extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final VoidCallback? onTap;

  const PokedexCardComponent(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.name,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const baseCardSize = 150.0;
    const imageSize = 80.0;
    const radios = 10.0;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: baseCardSize,
        width: baseCardSize,
        child: Stack(
          children: [
            SizedBox(
              height: baseCardSize,
              width: baseCardSize,
              child: Card(
                elevation: 3.0,
                margin: const EdgeInsets.only(left: 0, top: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radios),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 44,
                width: baseCardSize,
                child: Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radios),
                  ),
                  color: AppColors.shadow,
                ),
              ),
            ),
            Center(
                child: SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.network(fit: BoxFit.cover, imageUrl),
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(name),
                )),
            Container(
              height: baseCardSize,
              width: baseCardSize,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.shadow,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(radios),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  id,
                  style: TextStyle(fontSize: 12.0, color: AppColors.neutral),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

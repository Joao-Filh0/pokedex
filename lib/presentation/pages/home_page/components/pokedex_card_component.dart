import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class PokedexCardComponent extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final String? tag;
  final VoidCallback? onTap;

  const PokedexCardComponent(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.name,
      this.tag,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const baseCardSize = 150.0;
    final  imageSize = size.width * 0.15;
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
              child: Hero(
                  tag: tag ?? '',
                  child: Image.network(fit: BoxFit.cover, imageUrl)),
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: PokedexText(text: name),
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
                child: PokedexText(
                  text: id,
                  size: 12.0,
                  color: AppColors.neutral,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

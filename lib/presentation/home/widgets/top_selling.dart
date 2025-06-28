part of '../index.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Top Selling", style: AppStyles.styleBold18(context)),
            GestureDetector(
              onTap: () {},
              child: Text("See All", style: AppStyles.styleRegular16(context)),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text('title', style: AppStyles.styleRegular14(context)),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}

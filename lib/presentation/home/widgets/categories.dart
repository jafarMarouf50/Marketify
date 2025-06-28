part of '../index.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories", style: AppStyles.styleBold18(context)),
            GestureDetector(
              onTap: () {},
              child: Text("See All", style: AppStyles.styleRegular16(context)),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.14,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff2f2f2),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Text(
                      'title',
                      style: AppStyles.styleRegular14(context),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}

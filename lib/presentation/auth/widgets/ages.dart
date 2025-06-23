part of '../index.dart';

class Ages extends StatelessWidget {
  const Ages({super.key, required this.ages});

  final List<String> ages;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: MediaQuery.sizeOf(context).height / 2,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context.read<AgeSelectionCubit>().selectAge(ages[index]);
            },
            child: Text(ages[index]),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20);
        },
        itemCount: ages.length,
      ),
    );
  }
}

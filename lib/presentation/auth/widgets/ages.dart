part of '../index.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: MediaQuery.sizeOf(context).height / 2.7,
      child: BlocBuilder<GetAgesCubit, GetAgesState>(
        builder: (context, state) {
          if (state is GetAgesLoaded) {
            return _displayAges(state.ages);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _displayAges(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pop(context);
          context.read<AgeSelectionCubit>().selectAge(
            ages[index].data()['value'],
          );
        },
        child: Text(ages[index].data()['value']),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: ages.length,
    );
  }
}

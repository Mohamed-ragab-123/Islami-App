import 'package:flutter/material.dart';
import 'package:islami/home/tabs/quran_tab/sura_card.dart';
import 'package:islami/home/tabs/quran_tab/sura_name_item.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/sura_details/sura_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
   const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {

  void addSuraList(){
    for(int i = 0 ; i<114;i++){
      SuraModel.suraList.add(SuraModel(
          arName: SuraModel.arabicQuranSura[i],
          enName: SuraModel.englishQuranSura[i],
          ayaNum: SuraModel.ayaNumber[i],
          index: i,
          fileName: '${i+1}.txt',
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    addSuraList();
    loadLastSura();
  }

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchItem(),
            const SizedBox(height: 20),
            searchText.isNotEmpty?
            const SizedBox() : _mostRecently(),
            const SizedBox(height: 10),
            _suraNameVerticalList(),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _searchItem(){
    return
      Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
        onChanged: (text) {
          searchText = text;

          final result = SuraModel.suraList.where((sura) {
            return sura.arName.contains(searchText) ||
                sura.enName.toLowerCase().contains(searchText.toLowerCase());
          });

          final uniqueResult = <int, SuraModel>{};
          for (var sura in result) {
            uniqueResult[sura.index] = sura;
          }
          SuraModel.searchResult = uniqueResult.values.toList();
          setState(() {});
        },
        textDirection: TextDirection.rtl,
        cursorColor: Theme.of(context).primaryColor,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: const Color(0xFFFEFFE8),
        ),
        decoration: InputDecoration(
          labelText:"أسم السورة",
          labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: const Color(0xFFFEFFE8),
          ),
          prefixIcon:
          Image.asset(
            "assets/images/ic_quran.png",
            color: Theme.of(context).primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ) ,
            ),
      );
  }

  Widget _mostRecently() {
    return FutureBuilder<Map<String, dynamic>>(
      future: getLastSura(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "أخر سورة",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFFFEFFE8),
                ),
              ),
              const SizedBox(height: 10),
              const SuraCard(),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _suraNameVerticalList(){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("قائمة السور",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFFFEFFE8),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child:
          ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  saveLastSura(
                      enName: SuraModel.searchResult.isNotEmpty
                          ? SuraModel.searchResult[index].enName
                          : SuraModel.suraList[index].enName,
                      arName: SuraModel.searchResult.isNotEmpty
                          ? SuraModel.searchResult[index].arName
                          : SuraModel.suraList[index].arName,
                      ayaNum: SuraModel.searchResult.isNotEmpty
                          ? SuraModel.searchResult[index].ayaNum
                          : SuraModel.suraList[index].ayaNum,
                      index: SuraModel.searchResult.isNotEmpty
                          ? SuraModel.searchResult[index].index
                          : SuraModel.suraList[index].index,
                  );
                  Navigator.pushNamed(
                    context,
                    SuraDetailsScreen.routeName,
                    arguments: SuraModel.searchResult.isNotEmpty
                        ? SuraModel.searchResult[index]
                        : SuraModel.suraList[index],
                  ).then((_) {
                    loadLastSura();
                  });
                },
                child: SuraNameItem(
                  model: searchText.isNotEmpty
                      ? SuraModel.searchResult[index]
                      : SuraModel.suraList[index],
                ),
              );
            },
            separatorBuilder:
                (context, index) =>
            const Divider(
              color: Colors.white,
              endIndent: 40,
              indent: 40,
              thickness: 2,
            ),
            itemCount: searchText.isNotEmpty
                ? SuraModel.searchResult.length
                : 114,
          )
          ),
        ],
      ),
    );
  }

  Future<void> saveLastSura({
    required String enName,
    required String arName,
    required String ayaNum,
    required int index,
  })async{
    final SharedPreferences prefs  = await SharedPreferences.getInstance();
    await prefs.setString( 'enName' , enName);
    await prefs.setString( 'arName' , arName);
    await prefs.setString( 'ayaNum' , ayaNum);
    await prefs.setInt( 'indexOfLastSura' , index);
    await loadLastSura();
  }

  Future<Map<String , dynamic>> getLastSura()async{
    final SharedPreferences prefs  = await SharedPreferences.getInstance();
    String  enName = prefs.getString('enName') ?? '';
    String  arName = prefs.getString('arName') ?? '';
    String  ayaNum = prefs.getString('ayaNum') ?? '';
    int  index = prefs.getInt('indexOfLastSura')!;
    return {
      'enName' : enName,
      'arName' : arName,
      'ayaNum' : ayaNum,
      'indexOfLastSura' : index,
    };
  }

  loadLastSura() async {
    final lastSura = await getLastSura();
    if (lastSura.isNotEmpty) {
      SuraModel.lastSura = lastSura;
      setState(() {});
    }
  }
}

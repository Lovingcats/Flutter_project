import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/model/character.dart';

class showCharacter extends StatefulWidget {
  const showCharacter({Key? key}) : super(key: key);

  @override
  State<showCharacter> createState() => _showCharacterState();
}

class _showCharacterState extends State<showCharacter> {
  List<Character> characters = <Character>[];

  @override
  void initState() {
    super.initState();

    characters.add(Character("images/character/character1.png", "우바늘",
        "아무도 그가 존재하고 있는 줄 모른다\n존재감 제로의 우바늘"));
    characters.add(Character("images/character/character2.png", "정바토",
        "소문이 자자한 무서운 소마고 일짱\n사실 물주먹으로 조바냥을 괴롭히는 정바토"));
    characters.add(Character("images/character/character3.png", "최바돌",
        "엄청난 리더쉽을 가진 리더\n모든 아이들을 순식간에 제어하는 최바돌"));
    characters.add(Character("images/character/character4.png", "준바리",
        "소마고의 모자란 첩자\n모든 정보를 빼돌리는 최고의 스파이 준바리"));
    characters.add(Character("images/character/character5.png", "조바냥",
        "세상 물정도 모르는 고양이\n흘러가는대로 살아가는 멍텅구리 조바냥"));
    characters.add(Character("images/character/character6.png", "창바다",
        "현생이 찌달려 나칼롭고 예민한 성격의 소유지\n엄청난 다크서클의 소유자 천재 창바다"));
    characters.add(Character("images/character/character7.png", "윤바멍",
        "아름다운 선율을 들으면 도망쳐라\n준바리와 함께 하는 피아노 천재 스파이 윤바멍"));
    characters.add(Character("images/character/character8.png", "소바찍",
        "조바냥과 원수관계인 예민한 성격 소유자\n미친 인싸력의 소바찍"));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 38.w, right: 38.w, bottom: 20.h),
            child: ListTile(
              onTap: () {
                setState(() {
                  for (int i = 0; i < 8; i++) {
                    characters[i].isSelect = false;
                  }
                  characters[index].isSelect = true;
                });
              },
              tileColor: characters[index].isSelect
                  ? CommonColor.yellow
                  : Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1.h),
                borderRadius: BorderRadius.circular(10.h),
              ),
              leading: Image.asset(characters[index].url),
              title: Text(
                characters[index].name,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: "Grandstander",
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                characters[index].feature,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "Grandstander",
                    fontWeight: FontWeight.w500),
              ),

              isThreeLine: true,
              //dense: true,
            ),
          );
        },
      ),
    );
  }
}

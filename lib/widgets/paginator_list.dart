
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/appData.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PaginatorList extends StatelessWidget {

  dynamic vm;
  final ItemScrollController itemScrollController = ItemScrollController();
  PaginatorList({this.vm, });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print(itemScrollController.isAttached);
      if(vm.currentPage>4){
        itemScrollController.jumpTo(index: vm.currentPage-2);
      }
    });
    return Container(
      height: appData.dataPagerHeight,
      width: MediaQuery.of(context).size.width,

      child:Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
              child: Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0)
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/skip-back.svg"),
                ),
              ),
              onTap: (){
                if(vm.currentPage!=1){
                  vm.initLoading();
                  vm.fetchObjects(false,"",0);

                  print(vm.currentPage-1);
                }

              },
            ),
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              //padding: EdgeInsets.all(10.0),
              itemScrollController: this.itemScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: vm.pageCount,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 11.0, 10.0, 11.0),
                  child: InkWell(
                    child: Container(
                      height: 15.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0)
                        ),
                        color: vm.currentPage==(index+1)?
                          appData.primaryAppcolor1:
                          null,
                      ),
                      child: Center(
                        child: Text(
                          (index+1).toString(),
                          style: TextStyle(
                            color: vm.currentPage==(index+1)?
                            Colors.white:
                            null,
                          ),
                        )
                      ),
                    ),
                    onTap: (){




                      if((index+1)!=vm.currentPage){
                        vm.initLoading();
                        vm.fetchObjects(false,"",index);

                      }

                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
              child: Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0)
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/skip-forward.svg"),
                ),
              ),
              onTap: (){
                if(vm.currentPage!=vm.pageCount){
                  vm.initLoading();
                  vm.fetchObjects(false,"",vm.pageCount-1);
                  print(vm.currentPage-1);
                }

              },
            ),
          ),
        ],
      ),

    );

  }
}
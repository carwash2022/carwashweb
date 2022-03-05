
import 'package:carweb/core/Resposive.dart';
import 'package:carweb/core/colors.dart';
import 'package:carweb/dashboard/screen/widgets/dashbordcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class colorconayner extends StatefulWidget {
  const colorconayner({Key? key}) : super(key: key);

  @override
  _colorconaynerState createState() => _colorconaynerState();
}

class _colorconaynerState extends State<colorconayner> {
  @override
  Widget build(BuildContext context) {
  return  GetBuilder<dashbordcontroller>(
    init: dashbordcontroller(),
    builder: (logic) {
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/ 5,
          color: colorcontainer,
          child: Column(
            children: [

              SizedBox(height: 3*AppSizeConfig.heightMultiplier!,),
              Text("Dashboard",style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 2.5*AppSizeConfig.heightMultiplier!, color: Colors.white),),
              SizedBox(height: 3*AppSizeConfig.heightMultiplier!,),
             Row(
                mainAxisAlignment: MainAxisAlignment.end,
               children:[
GestureDetector(
  onTap:(){
    logic.widgetupdate(0);
},
            child:  tiels("Home" ,  Icons.home,logic.dash==0? Colors.white:Colors.transparent)),
                  ]
             ),
              SizedBox(height: 1.5*AppSizeConfig.heightMultiplier!,),
          Row(
             mainAxisAlignment: MainAxisAlignment.end,
              children:[

                GestureDetector(
                    onTap:(){
                      logic.widgetupdate(1);
                    },
                    child:
                  tiels("Vendor" ,  Icons.article_outlined, logic.dash==1? Colors.white:Colors.transparent)),
                  ]
          ),
              SizedBox(height: 1.5*AppSizeConfig.heightMultiplier!,),
          Row(
             mainAxisAlignment: MainAxisAlignment.end,
              children:[

                GestureDetector(
                  onTap:(){
                    logic.widgetupdate(2);
                  },
                  child:
                  tiels("Dealer" ,  Icons.article, logic.dash==2? Colors.white:Colors.transparent)),
                  ],
          ),
              SizedBox(height: 1.5*AppSizeConfig.heightMultiplier!,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
        children:[

          GestureDetector(
              onTap:(){
                logic.widgetupdate(3);
              },
              child:
                  tiels("User" ,  Icons.three_p_outlined, logic.dash==3? Colors.white:Colors.transparent)),
        ]
        )


      ]
              )
          );
    }
  );



  }
  tiels(String name , IconData icon, Color color){
    return Container(
      height: 2.7*AppSizeConfig.heightMultiplier!,
      width: 27.462424*AppSizeConfig.widthMultiplier!,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(22),bottomLeft:Radius.circular(22) ),
        color: color==Colors.white?Colors.white:Colors.transparent
      ),
      child: Row(
        children: [
          SizedBox(width: 2*AppSizeConfig.widthMultiplier!,),
          Icon(icon,color:color==Colors.white? Colors.black:Colors.white,),
          SizedBox(width: 2*AppSizeConfig.widthMultiplier!,),
          Text(name,style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 1.0*AppSizeConfig.heightMultiplier!, color: color==Colors.white? Colors.black:Colors.white),),

        ],
      ),

    );

  }
}

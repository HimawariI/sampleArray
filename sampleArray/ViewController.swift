//
//  ViewController.swift
//  sampleArray
//
//  Created by Himawari on 2016/08/27.
//  Copyright © 2016年 hackUmeko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スムージー候補が見つからない場合は味で提案するスムージーを変更する
        let multiSmoothie1 : String = "いちごのスムージー"//甘い
        let multiSmoothie2 : String = "青汁"//苦い
        let multiSmoothie3 : String = "野菜とグレープフルーツのスムージー"//さっぱり
        let multiSmoothie4 : String = "小松菜のまろやかスムージー"//まろやか
        
        //求めているスムージーの特徴
        let want : [Bool] = [true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false]
        
        //求めているスムージーの特徴からスムージーを探す
        let sm = searchSmoothie(want)
        print("want:"+sm)
        
        if sm != "" {
            //もしスムージーが存在するならば材料を表示
            //print(getIngredients(sm))
            var ingredients : [String] = getIngredients(sm)
            for num in 0...4{
                //print(ingredients[num])
                if num == 1{
                    print("ベースは…")
                }else if num == 2{
                    print("バランスは…")
                }else if num == 3{
                    print("水分は…")
                }else if num == 4{
                    print("+αするものは…")
                }
                
                let array = ingredients[num].componentsSeparatedByString(", ")
                for index in 0...array.count-1{
                    print(array[index])
                }
            }
        }else{//スムージーが見つからないならば、あらかじめ用意したものを表示する
            if want[4] == true {
                print(multiSmoothie1)
                print(getIngredients(multiSmoothie1))
            }else if want[6] == true {
                print(multiSmoothie3)
                print(getIngredients(multiSmoothie3))
            }else if want[7] == true {
                print(multiSmoothie4)
                print(getIngredients(multiSmoothie4))
            }else{//どれにも当てはまらないならばもれなく青汁を表示する
                print(multiSmoothie2)
                print(getIngredients(multiSmoothie2))
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func searchSmoothie(want: [Bool]) -> String {
        
        //スムージーの特徴の登録
        //[0スムージー名,1春,2夏,3秋,4冬、5甘、6苦、7さっぱり、8まろやか、9喜、10悲、11疲、12緊張、13ダイエット効果、14美肌効果、15目にいい、16疲労回復]
        
        //グレープフルーツとパイナップルのスムージー：夏さっぱり疲れ疲労
        let smoothie1 : [Any] = ["グレープフルーツとパイナップルのスムージー",false,true,false,false,false,false,true,false,false,false,true,false,false,false,false,true]
        //ぶどうとみかんのスムージー：夏秋甘さっぱり疲れダイエット美肌疲労
        let smoothie2 : [Any] = ["ぶどうとみかんのスムージー",false,true,true,false,true,false,true,false,false,false,true,false,true,true,false,true]
        //トマトとりんごのスムージー：春夏秋冬甘さっぱりまろやか疲れ緊張疲労
        let smoothie3 : [Any] = ["トマトとりんごのスムージー",true,true,true,true,true,false,true,true,false,false,true,true,false,false,false,true]
        //バナナと小松菜のスムージー:春夏秋冬甘苦まろやか疲れ緊張ダイエット美肌疲労
        let smoothie4 : [Any] = ["バナナと小松菜のスムージー",true,true,true,true,true,true,false,true,false,false,true,true,true,true,false,true]
        //さっぱりみかんスムージー：春夏秋冬さっぱり疲れ美肌疲労
        let smoothie5 : [Any] = ["さっぱりみかんスムージー",true,true,true,true,false,false,true,false,false,false,true,false,false,true,false,true]
        //まろやかみかんスムージー：春夏秋冬甘まろやか疲れ緊張疲労回復
        let smoothie6 : [Any] = ["まろやかみかんスムージー",true,true,true,true,true,false,false,true,false,false,true,true,false,false,false,true]
        //さっぱりレモンスムージー：夏さっぱり疲れ疲労回復
        let smoothie7 : [Any] = ["さっぱりレモンスムージー",false,false,true,false,false,false,true,false,false,false,false,false,false,false,false,true]
        //まろやかレモンスムージー：春夏秋冬甘まろやか疲れ緊張美肌疲労回復
        let smoothie8 : [Any] = ["まろやかレモンスムージー",
                                 true,true,true,true,
                                 true,false,false,true,
                                 false,false,true,true,
                                 false,true,false,true]
        //ルビーグレープフルーツスムージー：夏さっぱり疲れ疲労
        let smoothie9 : [Any] = ["ルビーグレープフルーツスムージー",
                                 false,true,false,false,
                                 false,false,true,false,
                                 false,false,true,false,
                                 false,false,false,true]
        //グレープフルーツスムージー：夏さっぱり疲れ美肌疲労
        let smoothie10 : [Any] = ["グレープフルーツスムージー",
                                  false,true,false,false,
                                  false,false,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //さっぱりキウイスムージー：春夏秋冬さっぱりダイエット
        let smoothie11 : [Any] = ["さっぱりキウイスムージー",
                                  true,true,true,true,
                                  false,false,true,false,
                                  false,false,false,false,
                                  true,false,false,false]
        //まろやかキウイスムージー：春夏秋冬甘いまろやか緊張ダイエット美肌
        let smoothie12 : [Any] = ["まろやかキウイスムージー",
                                  true,true,true,true,
                                  true,false,false,true,
                                  false,false,false,true,
                                  true,true,false,false]
        //ゴールドキウイといちごのスムージー：春夏秋冬さっぱりダイエット
        let smoothie13 : [Any] = ["ゴールドキウイといちごのスムージー",
                                  true,true,true,true,
                                  false,false,true,false,
                                  false,false,false,false,
                                  true,false,false,false]
        //まろやかゴールドキウイスムージー：春夏秋冬まろやかダイエット
        let smoothie14 : [Any] = ["まろやかゴールドキウイスムージー",
                                  true,true,true,true,
                                  false,false,false,true,
                                  false,false,false,false,
                                  true,false,false,false]
        //ブルーベリーとオレンジのスムージー：夏秋甘いさっぱり疲れダイエット美肌目
        let smoothie15 : [Any] = ["ブルーベリーとオレンジのスムージー",
                                  false,true,true,false,
                                  true,false,true,false,
                                  false,false,true,false,
                                  true,true,true,false]
        //ブルーベリーとマンゴーのスムージー：夏秋甘いまろやか疲れ緊張ダイエット目疲労
        let smoothie16 : [Any] = ["ブルーベリーとマンゴーのスムージー",
                                  false,true,true,false,
                                  true,false,false,true,
                                  false,false,true,true,
                                  true,false,true,true]
        //かぼちゃのホットスムージースープ：秋冬甘いまろやか喜び悲しい緊張
        let smoothie17 : [Any] = ["かぼちゃのホットスムージースープ",
                                  false,false,true,true,
                                  true,false,false,true,
                                  true,true,false,true,
                                  false,false,false,false]
        //かぼちゃのスムージー：秋冬甘いまろやか喜び緊張疲労
        let smoothie18 : [Any] = ["かぼちゃのスムージー",
                                  false,false,true,true,
                                  true,false,false,true,
                                  true,false,false,true,
                                  false,false,false,true]
        //さつまいものホットスムージースープ：秋冬甘いまろやか喜び悲しい緊張
        let smoothie19 : [Any] = ["さつまいものホットスムージースープ",
                                  false,false,true,true,
                                  true,false,false,true,
                                  true,true,false,true,
                                  false,false,false,false]
        //さつまいものスムージー：秋冬甘いまろやか喜び疲れ緊張疲労
        let smoothie20 : [Any] = ["さつまいものスムージー",
                                  false,false,true,true,
                                  true,false,false,true,
                                  true,false,true,true,
                                  false,false,false,true]
        //しょうがのホットスムージー：冬甘い喜び悲しい疲れ
        let smoothie21 : [Any] = ["しょうがのホットスムージー",
                                  false,false,false,true,
                                  true,false,false,false,
                                  true,true,true,false,
                                  false,false,false,false]
        //しょうがのスムージー：冬甘い喜び疲れ
        let smoothie22 : [Any] = ["しょうがのスムージー",
                                  false,false,false,true,
                                  true,false,false,false,
                                  true,false,true,false,
                                  false,false,false,false]
        //さっぱりいちごスムージー：春夏秋冬甘いさっぱり美肌
        let smoothie23 : [Any] = ["さっぱりいちごスムージー",
                                  true,true,true,true,
                                  true,false,true,false,
                                  false,false,false,false,
                                  false,true,false,false]
        //まろやかいちごスムージー：春夏秋冬甘いまったり美肌目
        let smoothie24 : [Any] = ["まろやかいちごスムージー",
                                  true,true,true,
                                  true,false,false,true,
                                  false,false,false,false,
                                  false,true,true,false]
        //オレンジとパイナップルのスムージー：夏甘いさっぱり疲れ美肌疲労
        let smoothie25 : [Any] = ["オレンジとパイナップルのスムージー",
                                  false,true,false,false,
                                  true,false,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //オレンジとチンゲンサイのスムージー：夏甘いまろやか疲れ緊張疲労
        let smoothie26 : [Any] = ["オレンジとチンゲンサイのスムージー",
                                  false,true,false,false,
                                  true,false,false,true,
                                  false,false,true,true,
                                  false,false,false,true]
        //キャベツとキウイのスムージー：春夏秋冬甘いさっぱりダイエット美肌
        let smoothie27 : [Any] = ["キャベツとキウイのスムージー",
                                  true,true,true,true,
                                  true,false,true,false,
                                  true,true,false,false]
        //キャベツとパイナップルのスムージー；春夏秋冬甘いさっぱり疲れ美肌疲労回復
        let smoothie28 : [Any] = ["キャベツとパイナップルのスムージー",
                                  true,true,true,true,
                                  true,false,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //さっぱり赤パプリカスムージー：春夏秋冬さっぱり疲れ美肌疲労
        let smoothie29 : [Any] = ["さっぱり赤パプリカスムージー",
                                  true,true,true,true,
                                  false,false,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //まろやか赤パプリカスムージー：春夏秋冬まろやか疲れ美肌疲労
        let smoothie30 : [Any] = ["まろやか赤パプリカスムージー",
                                  true,true,true,true,
                                  false,false,false,true,
                                  false,false,false,true,
                                  false,true,false,true]
        //さっぱりアボカドスムージー：春夏秋冬さっぱり疲れ美肌疲労
        let smoothie31 : [Any] = ["さっぱりアボカドスムージー",
                                  true,true,true,true,
                                  false,false,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //まろやかアボカドスムージー：春夏秋冬まろやか疲れ美肌疲労
        let smoothie32 : [Any] = ["まろやかアボカドスムージー",
                                  true,true,true,true,
                                  false,false,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //水菜とりんごのスムージー：春夏秋冬苦いさっぱり疲れ美肌疲労
        let smoothie33 : [Any] = ["水菜とりんごのスムージー",
                                  true,true,true,true,
                                  false,true,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //水菜とみかんのスムージー：春夏秋冬苦いまろやか疲れ美肌疲労
        let smoothie34 : [Any] = ["水菜とみかんのスムージー",
                                  true,true,true,true,
                                  false,true,false,true,
                                  false,false,true,false,
                                  false,true,false,true]
        //さっぱりメロンスムージー：夏甘いさっぱりダイエット美肌
        let smoothie35 : [Any] = ["さっぱりメロンスムージー",
                                  false,true,false,false,
                                  true,false,true,false,
                                  false,false,false,false,
                                  true,false,false,false]
        //まろやかメロンスムージー：夏甘いまろやか美肌
        let smoothie36 : [Any] = ["まろやかメロンスムージー",
                                  false,true,false,false,
                                  true,false,false,true,
                                  false,false,false,false,
                                  false,true,false,false]
        //さっぱりバナナスムージー：春夏秋冬甘いさっぱり疲れ美肌疲労
        let smoothie37 : [Any] = ["さっぱりバナナスムージー",
                                  true,true,true,true,
                                  true,false,true,false,
                                  false,false,true,false,
                                  false,true,false,true]
        //まろやかバナナスムージー：春夏秋冬甘いまろやか疲れ緊張美肌疲労
        let smoothie38 : [Any] = ["まろやかバナナスムージー",
                                  true,true,true,true,
                                  true,false,true,false,
                                  false,false,true,true,
                                  false,true,false,true]
        //さっぱりすいかのスムージー：夏甘いさっぱり美肌
        let smoothie39 : [Any] = ["さっぱりすいかのスムージー",
                                  false,true,false,false,
                                  true,false,true,false,
                                  false,false,false,false,
                                  false,true,false,false]
        //まろやかすいかのスムージー：夏甘いまろやか疲れ美肌疲労
        let smoothie40 : [Any] = [false,true,false,false,
                                  true,false,false,true,
                                  false,false,true,false,
                                  false,true,false,true]
        //サラダほうれんそうのスムージー：春夏秋冬苦いまろやか疲れ疲労
        let smoothie41 : [Any] = ["サラダほうれんそうのスムージー",
                                  true,true,true,true,
                                  false,true,false,true,
                                  false,false,true,false,
                                  false,false,false,true]
        
        var smoothie : [String] = []//スムージーの候補を保持しておく配列
        
        //完全一致したらそのまま返す
        //部分一致したら候補にいれる
        if getSmoothie(smoothie1, want: want)==0 {
            return smoothie1[0] as! String
        } else if getSmoothie(smoothie1, want: want)==1 {
            smoothie.append(smoothie1[0] as! String)
        }
        if getSmoothie(smoothie2, want: want)==0 {
            return smoothie2[0] as! String
        } else if getSmoothie(smoothie2, want: want)==1 {
            smoothie.append(smoothie2[0] as! String)
        }
        if getSmoothie(smoothie3, want: want)==0 {
            return smoothie3[0] as! String
        } else if getSmoothie(smoothie3, want: want)==1 {
            smoothie.append(smoothie3[0] as! String)
        }
        if getSmoothie(smoothie4, want: want)==0 {
            return smoothie4[0] as! String
        } else if getSmoothie(smoothie4, want: want)==1 {
            smoothie.append(smoothie4[0] as! String)
        }
        if getSmoothie(smoothie5, want: want)==0 {
            return smoothie5[0] as! String
        } else if getSmoothie(smoothie5, want: want)==1 {
            smoothie.append(smoothie5[0] as! String)
        }
        if getSmoothie(smoothie6, want: want)==0 {
            return smoothie6[0] as! String
        } else if getSmoothie(smoothie6, want: want)==1 {
            smoothie.append(smoothie6[0] as! String)
        }
        if getSmoothie(smoothie7, want: want)==0 {
            return smoothie7[0] as! String
        } else if getSmoothie(smoothie7, want: want)==1 {
            smoothie.append(smoothie7[0] as! String)
        }
        if getSmoothie(smoothie8, want: want)==0 {
            return smoothie8[0] as! String
        } else if getSmoothie(smoothie8, want: want)==1 {
            smoothie.append(smoothie8[0] as! String)
        }
        if getSmoothie(smoothie9, want: want)==0 {
            return smoothie9[0] as! String
        } else if getSmoothie(smoothie9, want: want)==1 {
            smoothie.append(smoothie9[0] as! String)
        }
        if getSmoothie(smoothie10, want: want)==0 {
            return smoothie10[0] as! String
        } else if getSmoothie(smoothie10, want: want)==1 {
            smoothie.append(smoothie10[0] as! String)
        }
        if getSmoothie(smoothie11, want: want)==0 {
            return smoothie11[0] as! String
        } else if getSmoothie(smoothie11, want: want)==1 {
            smoothie.append(smoothie11[0] as! String)
        }
        if getSmoothie(smoothie12, want: want)==0 {
            return smoothie12[0] as! String
        } else if getSmoothie(smoothie12, want: want)==1 {
            smoothie.append(smoothie12[0] as! String)
        }
        if getSmoothie(smoothie13, want: want)==0 {
            return smoothie13[0] as! String
        } else if getSmoothie(smoothie13, want: want)==1 {
            smoothie.append(smoothie13[0] as! String)
        }
        if getSmoothie(smoothie14, want: want)==0 {
            return smoothie14[0] as! String
        } else if getSmoothie(smoothie14, want: want)==1 {
            smoothie.append(smoothie14[0] as! String)
        }
        if getSmoothie(smoothie15, want: want)==0 {
            return smoothie15[0] as! String
        } else if getSmoothie(smoothie15, want: want)==1 {
            smoothie.append(smoothie15[0] as! String)
        }
        if getSmoothie(smoothie16, want: want)==0 {
            return smoothie16[0] as! String
        } else if getSmoothie(smoothie16, want: want)==1 {
            smoothie.append(smoothie16[0] as! String)
        }
        if getSmoothie(smoothie17, want: want)==0 {
            return smoothie17[0] as! String
        } else if getSmoothie(smoothie17, want: want)==1 {
            smoothie.append(smoothie17[0] as! String)
        }
        if getSmoothie(smoothie18, want: want)==0 {
            return smoothie18[0] as! String
        } else if getSmoothie(smoothie18, want: want)==1 {
            smoothie.append(smoothie18[0] as! String)
        }
        if getSmoothie(smoothie19, want: want)==0 {
            return smoothie19[0] as! String
        } else if getSmoothie(smoothie19, want: want)==1 {
            smoothie.append(smoothie19[0] as! String)
        }
        if getSmoothie(smoothie20, want: want)==0 {
            return smoothie20[0] as! String
        } else if getSmoothie(smoothie20, want: want)==1 {
            smoothie.append(smoothie20[0] as! String)
        }
        if getSmoothie(smoothie21, want: want)==0 {
            return smoothie21[0] as! String
        } else if getSmoothie(smoothie21, want: want)==1 {
            smoothie.append(smoothie21[0] as! String)
        }
        if getSmoothie(smoothie22, want: want)==0 {
            return smoothie22[0] as! String
        } else if getSmoothie(smoothie22, want: want)==1 {
            smoothie.append(smoothie22[0] as! String)
        }
        if getSmoothie(smoothie23, want: want)==0 {
            return smoothie23[0] as! String
        } else if getSmoothie(smoothie23, want: want)==1 {
            smoothie.append(smoothie23[0] as! String)
        }
        if getSmoothie(smoothie24, want: want)==0 {
            return smoothie24[0] as! String
        } else if getSmoothie(smoothie24, want: want)==1 {
            smoothie.append(smoothie24[0] as! String)
        }
        if getSmoothie(smoothie25, want: want)==0 {
            return smoothie25[0] as! String
        } else if getSmoothie(smoothie25, want: want)==1 {
            smoothie.append(smoothie25[0] as! String)
        }
        if getSmoothie(smoothie26, want: want)==0 {
            return smoothie26[0] as! String
        } else if getSmoothie(smoothie26, want: want)==1 {
            smoothie.append(smoothie26[0] as! String)
        }
        if getSmoothie(smoothie27, want: want)==0 {
            return smoothie27[0] as! String
        } else if getSmoothie(smoothie27, want: want)==1 {
            smoothie.append(smoothie27[0] as! String)
        }
        if getSmoothie(smoothie28, want: want)==0 {
            return smoothie28[0] as! String
        } else if getSmoothie(smoothie28, want: want)==1 {
            smoothie.append(smoothie28[0] as! String)
        }
        if getSmoothie(smoothie29, want: want)==0 {
            return smoothie29[0] as! String
        } else if getSmoothie(smoothie29, want: want)==1 {
            smoothie.append(smoothie29[0] as! String)
        }
        if getSmoothie(smoothie30, want: want)==0 {
            return smoothie30[0] as! String
        } else if getSmoothie(smoothie30, want: want)==1 {
            smoothie.append(smoothie30[0] as! String)
        }
        if getSmoothie(smoothie31, want: want)==0 {
            return smoothie31[0] as! String
        } else if getSmoothie(smoothie31, want: want)==1 {
            smoothie.append(smoothie31[0] as! String)
        }
        if getSmoothie(smoothie32, want: want)==0 {
            return smoothie32[0] as! String
        } else if getSmoothie(smoothie32, want: want)==1 {
            smoothie.append(smoothie32[0] as! String)
        }
        if getSmoothie(smoothie33, want: want)==0 {
            return smoothie33[0] as! String
        } else if getSmoothie(smoothie33, want: want)==1 {
            smoothie.append(smoothie33[0] as! String)
        }
        if getSmoothie(smoothie34, want: want)==0 {
            return smoothie34[0] as! String
        } else if getSmoothie(smoothie34, want: want)==1 {
            smoothie.append(smoothie34[0] as! String)
        }
        if getSmoothie(smoothie35, want: want)==0 {
            return smoothie35[0] as! String
        } else if getSmoothie(smoothie35, want: want)==1 {
            smoothie.append(smoothie35[0] as! String)
        }
        if getSmoothie(smoothie36, want: want)==0 {
            return smoothie36[0] as! String
        } else if getSmoothie(smoothie36, want: want)==1 {
            smoothie.append(smoothie36[0] as! String)
        }
        if getSmoothie(smoothie37, want: want)==0 {
            return smoothie37[0] as! String
        } else if getSmoothie(smoothie37, want: want)==1 {
            smoothie.append(smoothie37[0] as! String)
        }
        if getSmoothie(smoothie38, want: want)==0 {
            return smoothie38[0] as! String
        } else if getSmoothie(smoothie38, want: want)==1 {
            smoothie.append(smoothie38[0] as! String)
        }
        if getSmoothie(smoothie39, want: want)==0 {
            return smoothie39[0] as! String
        } else if getSmoothie(smoothie39, want: want)==1 {
            smoothie.append(smoothie39[0] as! String)
        }
        if getSmoothie(smoothie40, want: want)==0 {
            return smoothie40[0] as! String
        } else if getSmoothie(smoothie40, want: want)==1 {
            smoothie.append(smoothie40[0] as! String)
        }
        if getSmoothie(smoothie41, want: want)==0 {
            return smoothie41[0] as! String
        } else if getSmoothie(smoothie41, want: want)==1 {
            smoothie.append(smoothie41[0] as! String)
        }
        
        //スムージー候補が複数の場合はランダムで一つ選んでそれを返す
        var rand : Int = 0
        if smoothie.count > 0 {
            rand = Int(arc4random_uniform(UInt32(smoothie.count)))
            //print("選ばれしものは"+smoothie[rand])
            return smoothie[rand]
        }
        
        //スムージー候補がない場合は空を返す
        return ""
        
    }
    //配列から検索をする
    //@return 0:完全一致　1:部分一致　2:一致しない
    func getSmoothie(smoothie : [Any], want : [Bool]) -> Int{
        var flg : Bool = true
        if matchSmoothie(smoothie, want: want) == true {
            return 0
        }else {
            for num in 0...15 {
                if want[num] == true {
                    if smoothie[num+1] as! Bool == false {
                        flg = false
                    }
                }
            }
            if flg == true {
                return 1
            }
        }
        return 2
    }
    
    //完全一致するかどうかを判定するメソッド
    //@return true:完全一致　false:完全一致しない
    func matchSmoothie(smoothie : [Any], want : [Bool]) ->Bool{
        for index in 1...smoothie.count-1{
            if smoothie[index] as! Bool != want[index-1] {
                return false
            }
        }
        return true
    }
    
    //材料のはいった配列を渡す
    //材料がなければないと渡す
    func getIngredients(smooth : String) -> [String]{
        
        let multiSmoothie1 : [String] = ["いちごのスムージー","いちご...5粒","ヨーグルト...大さじ3","牛乳...120ml","砂糖...小さじ2"]
        let multiSmoothie2 : [String] = ["青汁","小松菜...1株","オリゴ糖...大さじ1","酢...大さじ1"]
        let multiSmoothie3 : [String] = ["野菜とグレープフルーツのスムージー","にんじん...1/2本","アボカド...1/2コ","グレープフルーツ...1/2コ","パイナップル...1/4コ","レモン汁...小さじ1"]
        let multiSmoothie4 : [String] = ["小松菜のまろやかスムージー","小松菜...100g","バナナ...1/2本","レモン汁...小さじ1","豆乳...400g","はちむつ...大さじ1"]
        
        //[スムージー名,ベース、バランス、水分、プラスα]
        let smoothie1 : [String] = ["グレープフルーツとパイナップルのスムージー","グレープフルーツ...1/2コ","パイナップル...100g","水...1/4カップ","はちみつ...小さじ2"]
        let smoothie2 : [String] = ["ぶどうとみかんのスムージー","ぶどう...(大)10粒","みかん...1コ","ヨーグルトドリンク...1/4カップ","レモン汁...小さじ1/2"]
        let smoothie3 : [String] = ["トマトとりんごのスムージー","トマト...1コ","りんご...1/4コ","水...1/4カップ","レモン汁...小さじ1/2, はちみつ...小さじ1"]
        let smoothie4 : [String] = ["バナナと小松菜のスムージー","バナナ...1本","小松菜...1/6ワ","牛乳...1/2カップ","はちみつ...小さじ1"]
        let smoothie5 : [String] = ["さっぱりみかんスムージー","みかん...1コ","ミニトマト...8コ, ライム...1/4コ","水...1/4カップ","はちみつ...小さじ1"]
        let smoothie6 : [String] = ["まろやかみかんスムージー","みかん...1コ","マンゴー...1/2コ, 黄パプリカ...1/4コ","牛乳...1/4カップ","はちみつ...小さじ1"]
        let smoothie7 : [String] = ["さっぱりレモンスムージー","レモン...1/2コ","パイナップル...100g, きゅうり...1/3本","水...1/4カップ","はちみつ...小さじ2"]
        let smoothie8 : [String] = ["まろやかレモンスムージー","レモン...1/2コ","オレンジ...1コ, バナナ...1/2本","水...1/4カップ","はちみつ...小さじ1"]
        let smoothie9 : [String] = ["ルビーグレープフルーツスムージー","ルビーグレープフルーツ...1/2コ","りんご...1/4コ","水...1/4カップ","はちみつ...小さじ2"]//さっぱり
        let smoothie10 : [String] = ["グレープフルーツスムージー","グレープフルーツ...1/2コ","サラダほうれんそう...1/2ワ","ヨーグルトドリンク...1/4カップ","はちみつ...小さじ2"]//まろやか
        let smoothie11 : [String] = ["さっぱりキウイスムージー","キウイ...1コ","りんご...1/3コ","ヨーグルトドリンク...1/2カップ","なし"]
        let smoothie12 : [String] = ["まろやかキウイスムージー","キウイ...1コ","アボカド...1/4コ, チンゲンサイ...1/4株","ヨーグルトドリンク...1/2カップ","レモン汁...小さじ1/2, はちみつ...小さじ1"]
        let smoothie13 : [String] = ["ゴールドキウイといちごのスムージー","ゴールドキウイ...1コ","いちご...5コ","ヨーグルトドリンク...1/2カップ","なし"]
        let smoothie14 : [String] = ["まろやかゴールドキウイスムージー","ゴールドキウイ...1コ","セロリ...1/4本","ヨーグルトドリンク1/2カップ","すりごま(白)...小さじ1, はちみつ...小さじ1/2"]
        let smoothie15 : [String] = ["ブルーベリーとオレンジのスムージー","ブルーベリー...50g","オレンジ...1コ, セロリ...1/4本","ヨーグルトドリンク...1/2カップ","レモン汁...小さじ1, はちみつ...小さじ1"]
        let smoothie16 : [String] = ["ブルーベリーとマンゴーのスムージー","ブルーベリー...50g","マンゴー...1コ","ヨーグルトドリンク...1.2カップ","なし"]
        let smoothie17 : [String] = ["かぼちゃのホットスムージースープ","かぼちゃ...70g","たまねぎ...1/8コ","豆乳...1/2カップ","コンソメ...小さじ1/2"]
        let smoothie18 : [String] = ["かぼちゃのスムージー","かぼちゃ...70g","みかん...1コ","水...1/4カップ","ローストアーモンド...3粒, はちみつ小さじ1/2"]
        let smoothie19 : [String] = ["さつまいものホットスムージースープ","さつまいも...70g","なし","牛乳...3/4カップ","コンソメ...小さじ2/3, 一味唐辛子...少々"]
        let smoothie20 : [String] = ["さつまいものスムージー","さつまいも...50g","りんご...1/4コ","水...1/2カップ","きな粉...小さじ1, はちみつ...小さじ1/2"]
        let smoothie21 : [String] = ["しょうがのホットスムージー","しょうが...1/4かけ","みかん...1コ","水...1/4カップ","はちみつ...小さじ1"]
        let smoothie22 : [String] = ["しょうがのスムージー","しょうが...1/4かけ","りんご...1/4コ, にんじん...1/5本","水...1/2カップ","レモン汁...小さじ1, はちみつ...小さじ1"]
        let smoothie23 : [String] = ["さっぱりいちごスムージー","いちご...7コ","ミニトマト...7コ","ヨーグルトドリンク...1/4カップ","なし"]
        let smoothie24 : [String] = ["まろやかいちごスムージー","いちご...7コ","ブルーベリー...30g","牛乳...1/4カップ","なし"]
        let smoothie25 : [String] = ["オレンジとパイナップルのスムージー","オレンジ...1コ","パイナップル...50g, レモン...1/4コ","ヨーグルトドリンク...1/4カップ","なし"]
        let smoothie26 : [String] = ["オレンジとチンゲンサイのスムージー","オレンジ...1コ","チンゲンサイ...1/2株","牛乳...1/4カップ","レモン汁...小さじ1/2, はちみつ...小さじ1"]
        let smoothie27 : [String] = ["キャベツとキウイのスムージー","キャベツ(中)...1枚","キウイ...1コ","ヨーグルトドリンク...1/2カップ","はちみつ...小さじ1"]
        let smoothie28 : [String] = ["キャベツとパイナップルのスムージー","キャベツ(中)...1枚","パイナップル...100g","牛乳...1/2カップ","レモン汁...小さじ1, はちみつ...小さじ2"]
        let smoothie29 : [String] = ["さっぱり赤パプリカスムージー","赤パプリカ...1/4コ","ルビーグレープフルーツ...1/2コ","ヨーグルトドリンク...1/4カップ","はちみつ...小さじ2"]
        let smoothie30 : [String] = ["まろやか赤パプリカスムージー","赤パプリカ...1/4コ","りんご...1/3コ","牛乳...1/2カップ","レモン汁...小さじ1, はちみつ...小さじ2"]
        let smoothie31 : [String] = ["さっぱりアボカドスムージー","アボカド...1/2コ","グレープフルーツ...1/2コ, セロリ...1/4本","水...1/2カップ","はちみつ...大さじ1"]
        let smoothie32 : [String] = ["まろやかアボカドスムージー","アボカド...1/4コ","パイナップル...100g","ヨーグルトドリンク...1/2カップ","レモン汁...小さじ1/2, はちみつ...小さじ1"]
        let smoothie33 : [String] = ["水菜とりんごのスムージー","水菜...1/6ワ","りんご...1/3コ","水...1/2カップ","青じそ...2枚, レモン汁...小さじ1, はちみつ...小さじ2"]
        let smoothie34 : [String] = ["水菜とみかんのスムージー","水菜...1/6ワ","みかん...1コ","ヨーグルトドリンク...1/2カップ","レモン汁...小さじ1/2, はちみつ...小さじ1"]
        let smoothie35 : [String] = ["さっぱりメロンスムージー","メロン...100g","ゴールドキウイ...1コ","水...1/4カップ","はちみつ...小さじ1"]
        let smoothie36 : [String] = ["まろやかメロンスムージー","メロン...100g","チンゲンサイ...1/4株","ヨーグルトドリンク...カップ1/4","レモン汁...小さじ1/2, はちみつ...小さじ1/2"]
        let smoothie37 : [String] = ["さっぱりバナナスムージー","バナナ...1本","ルビーグレープフルーツ...1/4コ","水...1/4カップ","しょうが...1/4かけ, はちみつ...小さじ1"]
        let smoothie38 : [String] = ["まろやかバナナスムージー","バナナ...1本","ミニトマト...8コ","水...1/4カップ","レモン汁...小さじ1, はちみつ...小さじ1"]
        let smoothie39 : [String] = ["さっぱりすいかのスムージー","すいか...100g","いちご...5コ","水...1/4カップ","はちみつ...小さじ1"]
        let smoothie40 : [String] = ["まろやかすいかのスムージー","すいか...100g","バナナ...1/2本","豆乳...1/4カップ","ローストアーモンド...3粒"]
        let smoothie41 : [String] = ["サラダほうれんそうのスムージー","サラダほうれんそう...1/4ワ","バナナ...1本","豆乳...1/2カップ","はちみつ...小さじ1"]
        
        var sm : [String] = ["レシピが存在しません"]
        
        if smooth == multiSmoothie1[0]{
            sm = multiSmoothie1;
        }else if smooth == multiSmoothie2[0]{
            sm = multiSmoothie2;
        }else if smooth == multiSmoothie3[0]{
            sm = multiSmoothie3;
        }else if smooth == multiSmoothie4[0]{
            sm = multiSmoothie4;
        }else if smooth == smoothie1[0]{
            sm = smoothie1;
        }else if smooth == smoothie2[0]{
            sm = smoothie2;
        }else if smooth == smoothie3[0]{
            sm = smoothie3;
        }else if smooth == smoothie4[0]{
            sm = smoothie4;
        }else if smooth == smoothie5[0]{
            sm = smoothie5;
        }else if smooth == smoothie6[0]{
            sm = smoothie6;
        }else if smooth == smoothie7[0]{
            sm = smoothie7;
        }else if smooth == smoothie8[0]{
            sm = smoothie8;
        }else if smooth == smoothie9[0]{
            sm = smoothie9;
        }else if smooth == smoothie10[0]{
            sm = smoothie10;
        }else if smooth == smoothie11[0]{
            sm = smoothie11;
        }else if smooth == smoothie12[0]{
            sm = smoothie12;
        }else if smooth == smoothie13[0]{
            sm = smoothie13;
        }else if smooth == smoothie14[0]{
            sm = smoothie14;
        }else if smooth == smoothie15[0]{
            sm = smoothie15;
        }else if smooth == smoothie16[0]{
            sm = smoothie16;
        }else if smooth == smoothie17[0]{
            sm = smoothie17;
        }else if smooth == smoothie18[0]{
            sm = smoothie18;
        }else if smooth == smoothie19[0]{
            sm = smoothie19;
        }else if smooth == smoothie20[0]{
            sm = smoothie20;
        }else if smooth == smoothie21[0]{
            sm = smoothie21;
        }else if smooth == smoothie22[0]{
            sm = smoothie22;
        }else if smooth == smoothie23[0]{
            sm = smoothie23;
        }else if smooth == smoothie24[0]{
            sm = smoothie24;
        }else if smooth == smoothie25[0]{
            sm = smoothie25;
        }else if smooth == smoothie26[0]{
            sm = smoothie26;
        }else if smooth == smoothie27[0]{
            sm = smoothie27;
        }else if smooth == smoothie28[0]{
            sm = smoothie28;
        }else if smooth == smoothie29[0]{
            sm = smoothie29;
        }else if smooth == smoothie30[0]{
            sm = smoothie30;
        }else if smooth == smoothie31[0]{
            sm = smoothie31;
        }else if smooth == smoothie32[0]{
            sm = smoothie32;
        }else if smooth == smoothie33[0]{
            sm = smoothie33;
        }else if smooth == smoothie34[0]{
            sm = smoothie34;
        }else if smooth == smoothie35[0]{
            sm = smoothie35;
        }else if smooth == smoothie36[0]{
            sm = smoothie36;
        }else if smooth == smoothie37[0]{
            sm = smoothie37;
        }else if smooth == smoothie38[0]{
            sm = smoothie38;
        }else if smooth == smoothie39[0]{
            sm = smoothie39;
        }else if smooth == smoothie40[0]{
            sm = smoothie40;
        }else if smooth == smoothie41[0]{
            sm = smoothie41;
        }
        
        return sm
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


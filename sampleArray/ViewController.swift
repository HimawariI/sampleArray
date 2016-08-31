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
        let want : [Any] = [true,true,true,true,true,false,true,true,false,false,true,true,false,false,false,true]
        print("want:");
        var sm = searchSmoothie(want)
        print(sm)
        if sm.count > 0 {
            print(getIngredients(sm[0]))
        }else{
            print("該当するスムージーはありません")
        }
        
        print("want2:");
        let want2 : [Any] = [true,true,true,true,true,true,false,true,false,false,true,true,true,true,false,true]
        sm = searchSmoothie(want2)
        print(sm)
        if sm.count > 0 {
            print(getIngredients(sm[0]))
        }else{
            print("該当するスムージーはありません")
        }
        
        print("want3:");
        let want3 : [Any] = [true,true,true,true,false,false,true,false,false,false,true,false,false,true,false,true]
        sm = searchSmoothie(want3)
        print(sm)
        if sm.count > 0 {
            print(getIngredients(sm[0]))
        }else{
            print("該当するスムージーはありません")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func searchSmoothie(want: [Any]) -> [String] {
        
        //var smoothie : [String] = ["いちごスムージー","バナナスムージー","りんごスムージー"]
        //print(smoothie)
        
        
        //スムージーの特徴の登録
        //[スムージー名,春,夏,秋,冬、甘、苦、さっぱり、まろやか、喜、悲、疲、緊張、ダイエット効果、美肌効果、目にいい、疲労回復]
        
        //グレープフルーツとパイナップルのスムージー：夏さっぱり疲れ疲労
        let smoothie1 : [Any] = ["グレープフルーツとパイナップルのスムージー",false,true,false,false,false,false,true,false,false,false,true,false,false,false,false,true]
        //ぶどうとみかんのスムージー：夏秋甘さっぱり疲れダイエット美肌疲労
        let smoothie2 : [Any] = ["ぶどうとみかんのスムージー",false,true,true,false,true,false,true,false,false,false,true,false,true,true,false,true]
        //トマトとりんごのスムージー：春夏秋冬甘さっぱりまろやか疲れ緊張疲労
        let smoothie3 : [Any] = ["トマトとりんごのスムージー",true,true,true,true,true,false,true,true,false,false,true,true,false,false,false,true]
        //バナナと小松菜のスムージー:春夏秋冬甘苦まろやか疲れ緊張ダイエット美肌疲労
        let smoothie4 : [Any] = ["バナナと小松菜のスムージー",true,true,true,true,true,true,false,true,false,false,true,true,true,true,false,true]
        //みかんスムージー：春夏秋冬さっぱり疲れ美肌疲労
        let smoothie5 : [Any] = ["みかんスムージー",true,true,true,true,false,false,true,false,false,false,true,false,false,true,false,true]
        
        //let smoothie1 : [Any] = ["いちごスムージー",true,true,true,true,true,false,true,false,true,false,false,]
        //let smoothie2 : [Any] = ["バナナスムージー",true,false,false,false]
        //let smoothie3 : [Any] = ["りんごスムージー",true,true,false,true]
        var smoothie : [String] = []
        
        if getSmoothie(smoothie1, want: want)==true {
            smoothie.append(smoothie1[0] as! String)
        }
        if getSmoothie(smoothie2, want: want)==true {
            smoothie.append(smoothie2[0] as! String)
        }
        if getSmoothie(smoothie3, want: want)==true {
            smoothie.append(smoothie3[0] as! String)
        }
        if getSmoothie(smoothie4, want: want)==true {
            smoothie.append(smoothie4[0] as! String)
        }
        if getSmoothie(smoothie5, want: want)==true {
            smoothie.append(smoothie5[0] as! String)
        }
        
    /*
        /*
         欲しいスムージーと特徴が合わなければfalse
         あえばtrueにする
         */
        var flg = true
        for index in 1...smoothie1.count-1{
            if smoothie1[index] as! Bool != want[index-1] as! Bool {
                flg = false
            }
        }
        //もしも欲しいスムージーじゃなければ配列から取り出す
        if flg == false{
            for num in 0...smoothie.count-1{
                if smoothie[num] == smoothie1[0] as! String{
                    //print(smoothie[num])
                    smoothie.removeAtIndex(num)
                    
                    break
                }
            }
        }
        /*if flg == true{
         print(smoothie1[0])
         }*/
        
        
        flg = true
        for index in 1...smoothie2.count-1{
            if smoothie2[index] as! Bool != want[index-1] as! Bool {
                flg = false
            }
        }
        if flg == false{
            for num in 0...smoothie.count-1{
                if smoothie[num] == smoothie2[0] as! String{
                    //print(smoothie[num])
                    smoothie.removeAtIndex(num)
                    break
                }
            }
        }
        /*if flg == true{
         print(smoothie2[0])
         }*/
        
        
        flg = true
        for index in 1...smoothie3.count-1{
            if smoothie3[index] as! Bool != want[index-1] as! Bool {
                flg = false
            }
        }
        if flg == false{
            for num in 0...smoothie.count-1{
                if smoothie[num] == smoothie3[0] as! String{
                    //print(smoothie[num])
                    smoothie.removeAtIndex(num)
                    break
                }
            }
        }
        /* if flg == true{
         print(smoothie3[0])
         }*/*/
        
        //スムージー一覧を返す(配列を返してるけど実際必要なのは一つだからここで複数あったらrandamで選ぶようにして一つ返すのもあり。
        return smoothie
        
    }
    //配列から検索をする
    func getSmoothie(smoothie : [Any], want : [Any]) -> Bool{
        var flg = true
        for index in 1...smoothie.count-1{
            if smoothie[index] as! Bool != want[index-1] as! Bool {
                flg = false
            }
        }
        if flg == true{
            return true
        }
        return false
    }
    
    //材料を受け渡す
    func getIngredients(smooth : String) -> [String]{
        
        //[スムージー名,ベース、バランス、水分、プラスα]
        let smoothie1 : [String] = ["グレープフルーツとパイナップルのスムージー","グレープフルーツ...1/2コ","パイナップル...100g","水...1/4カップ","はちみつ...小さじ2"]
        let smoothie2 : [String] = ["ぶどうとみかんのスムージー","ぶどう...(大)10粒","みかん...1コ","ヨーグルトドリンク...1/4カップ","レモン汁...小さじ1/2"]
        let smoothie3 : [String] = ["トマトとりんごのスムージー","トマト...1コ","りんご...1/4コ","水...1/4カップ","レモン汁...小さじ1/2, はちみつ...小さじ1"]
        let smoothie4 : [String] = ["バナナと小松菜のスムージー","バナナ...1本","小松菜...1/6ワ","牛乳...1/2カップ","はちみつ...小さじ1"]
        let smoothie5 : [String] = ["みかんスムージー","みかん...1コ","ミニトマト...8コ, ライム...1/4コ","水...1/4カップ","はちみつ...小さじ1"]

        //let smoothie : [String] = ["いちごスムージー","いちご...7コ","ミニトマト...7コ","ヨーグルトドリンク...1/4カップ"]
        //let smoothie : [String] = ["バナナスムージー","バナナ...1本","ルビーグレープフルーツ...1/4コ","水...1/4カップ","しょうが...1/4かけ","はちみつ...小さじ1"]
        
        var sm : [String] = ["レシピが存在しません"]
        
        if smooth == smoothie1[0]{
            sm = smoothie1;
        }else if smooth == smoothie2[0]{
            sm = smoothie2;
        }else if smooth == smoothie3[0]{
            sm = smoothie3;
        }else if smooth == smoothie4[0]{
            sm = smoothie4;
        }else if smooth == smoothie5[0]{
            sm = smoothie5;
        }
        return sm
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//
//  ViewController.swift
//  Choice
//
//  Created by User15 on 2018/12/4.
//  Copyright © 2018 Chia. All rights reserved.
//

import UIKit

struct QueStruct {
    var Que:String
    var choose:[String]=[]
    var ans:Int
    var selected:Bool
}

class ViewController: UIViewController {

    @IBOutlet weak var But1: UIButton!
    @IBOutlet weak var But2: UIButton!
    @IBOutlet weak var But3: UIButton!
    @IBOutlet weak var But4: UIButton!
    @IBOutlet weak var QueNum: UILabel!
    @IBOutlet weak var Que: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Restart: UIButton!
    
    var count=1
    var point=0
    var QueArray:[QueStruct]=[]
    var randomQueArray:[QueStruct]=[]
    
    func allQuestion() {
        QueArray.append(QueStruct(Que:"請問巧克力 不 含什麼成份？", choose:["可可脂","可可鹼","多巴胺","阿拉伯膠"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"何者 非 巧克力品牌", choose:["Lindt","GEO","Godiva","Royce"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"歷史發現 最早製作巧克力的人：", choose:["台灣人","羅馬人","埃及人","墨西哥人"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"黑巧克力有什麼作用", choose:["降低膽固醇","降低心跳","降低血壓","降低智商"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"貓狗等動物吃巧克力會死掉是因為無法代謝哪個成分？", choose:["大麻素","多巴胺","羥色胺","可可鹼"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish最近最喜歡吃哪種巧克力製品？", choose:["巧克力餅乾","巧克力冰淇淋","巧克力飲","巧克力蛋糕"], ans: 1, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish從什麼時候開始愛吃巧克力?", choose:["一出生","有記憶以來","8歲","15歲"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish的媽媽曾經稱她為", choose:["巧克力","巧克力精","巧克力公主","巧克力女王"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish為什麼不能想吃巧克力就吃？", choose:["因為會變胖","因為會太開心","因為醫生說會讓她過敏更嚴重","因為會破產"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish最常吃哪種巧克力冰？", choose:["明治","哈根達斯","酷聖石","杜老爺"], ans: 1, selected:false))
        QueArray.append(QueStruct(Que:"妮娜巧克力夢想城堡在哪？", choose:["外太空","台北","基隆","南投"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"美國食藥監管局條例允許每100克巧克力有幾隻蟲？", choose:["6","60","600","6000"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"哪部電影有說：「生命就像一盒巧克力，你永遠也不會知道你將拿到什麼口味。」", choose:["美國隊長","變形金剛","怪獸電力公司","阿甘正傳"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish 不 喜歡什麼口味的巧克力？", choose:["焦糖","酒","香草","牛奶"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"什麼節慶 不會 熱銷巧克力?", choose:["萬聖節","聖誕節","情人節","清明節"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish吃巧克力 不 會有什麼感覺？", choose:["幸福","快樂","升天","滿足"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"Chiafish喜歡哪一牌的巧克力?", choose:["Royce","Snickers","MilkyWay","BOO"], ans: 1, selected:false))


    }
    
    func ramdomNum()
    {
        while  randomQueArray.count<=10{
            
            let number = Int.random(in: 0...QueArray.count-1)
            if(QueArray[number].selected==false){
                randomQueArray.append(QueArray[number])
                QueArray[number].selected=true
            }
        }
        print(randomQueArray)
    }
    func getQuestion()
    {
        QueNum.text=String(count)
        Que.text=randomQueArray[count-1].Que
        But1.setTitle(randomQueArray[count-1].choose[0], for:UIControl.State.normal)
        But2.setTitle(randomQueArray[count-1].choose[1], for:UIControl.State.normal)
        But3.setTitle(randomQueArray[count-1].choose[2], for:UIControl.State.normal)
        But4.setTitle(randomQueArray[count-1].choose[3], for:UIControl.State.normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allQuestion()
        ramdomNum()
        getQuestion()
        Restart.isEnabled=false
        Restart.isHidden=true
    }

    @IBAction func Choose(_ sender: UIButton) {
        if((sender==But1&&randomQueArray[count-1].ans==1)||(sender==But2&&randomQueArray[count-1].ans==2)||(sender==But3&&randomQueArray[count-1].ans==3)||(sender==But4&&randomQueArray[count-1].ans==4)) {
            point = point + 10
            Score.text=String(point)
        }
            count = count + 1
        if (count <= 10){
            getQuestion()
        }
        else{
            But1.isEnabled=false
            But2.isEnabled=false
            But3.isEnabled=false
            But4.isEnabled=false
            Restart.isEnabled=true
            Restart.isHidden=false
        }

    }
    
    @IBAction func RestartC(_ sender: UIButton) {
        
        for i in (0...QueArray.count-1) {
            QueArray[i].selected=false
        }
        randomQueArray.removeAll()
        ramdomNum()
        count=1
        getQuestion()
        point=0;
        Score.text=String(point)
        But1.isEnabled=true
        But2.isEnabled=true
        But3.isEnabled=true
        But4.isEnabled=true
        Restart.isEnabled=false
        Restart.isHidden=true
        
    }
}


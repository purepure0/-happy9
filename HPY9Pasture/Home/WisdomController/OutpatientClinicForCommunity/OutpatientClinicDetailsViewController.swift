//
//  OutpatientClinicDetailsViewController.swift
//  HPY9Pasture
//
//  Created by purepure on 17/2/8.
//  Copyright © 2017年 xiaocool. All rights reserved.
//

import UIKit

class OutpatientClinicDetailsViewController: UIViewController,SDCycleScrollViewDelegate {
    
    let mainSCView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        self.view.backgroundColor = LGBackColor
        self.creatUI()

        // Do any additional setup after loading the view.
    }
    
    func creatUI(){
        self.mainSCView.frame = CGRectMake(0, -20, WIDTH, HEIGHT+20)
        self.mainSCView.backgroundColor = UIColor.redColor()
        let myImageScroolView = SDCycleScrollView.init(frame: CGRectMake(0, 0, Screen_W, 165*px), delegate: self, placeholderImage: UIImage(named: "zhihui_tupainzanshiwufaxinashi"))
        
        myImageScroolView.imageURLStringsGroup = ["http://www.lagou.com/upload/webproduct/bd00394b005842dfa13364678d2ff6cd.jpg","http://imgsrc.baidu.com/forum/w%3D580/sign=35f5eb13f703738dde4a0c2a831ab073/80b0bd6eddc451da0d3f9858b7fd5266d1163219.jpg","http://s7.sinaimg.cn/mw690/005Xo3wSgy6WfLXd2n4c6&690","http://img5.duitang.com/uploads/item/201408/01/20140801115317_YSzEn.thumb.700_0.jpeg"]
        
        self.mainSCView.addSubview(myImageScroolView)
        
        let backButton = UIButton.init(frame: CGRectMake(10, 20, 30, 30))
        backButton.setImage(UIImage(named: "ic_fanhui"), forState: .Normal)
        backButton.backgroundColor = RGBACOLOR(50, g: 50, b: 50, a: 0.5)
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 15
        backButton.addTarget(self, action: #selector(self.backButtonAction), forControlEvents: .TouchUpInside)
        
        let infoBackView = UIView.init(frame: CGRectMake(0, myImageScroolView.height, WIDTH, 100*px))
        infoBackView.backgroundColor = UIColor.whiteColor()
        let clinicName = AutoScrollLabel.init(frame: CGRectMake(10*px, 15*px, WIDTH-10*px, 25*px))
        clinicName.text = "青岛百姓人家社区诊所"
        clinicName.textAlignment = .Left
        clinicName.font = MainFont
        infoBackView.addSubview(clinicName)
        
        let personHeaderImageView = UIImageView.init(image: UIImage(named:"ic_fuzeren" ))
        personHeaderImageView.frame = CGRectMake(10*px, clinicName.height+20*px, 14*px, 15*px)
        infoBackView.addSubview(personHeaderImageView)
        
        let personName = UILabel.init(frame: CGRectMake(30*px, personHeaderImageView.frame.origin.y, WIDTH/2-30*px, personHeaderImageView.height))
        personName.text = "负责人："+"柳眉"
        personName.font = UIFont.systemFontOfSize(12)
        personName.textAlignment = .Left
        personName.textColor = MainTextBackColor
        infoBackView.addSubview(personName)
        
        let phoneName = UILabel.init(frame: CGRectMake(WIDTH/2, personHeaderImageView.frame.origin.y, WIDTH/2, personHeaderImageView.height))
        phoneName.text = "15032587496"
        phoneName.font = UIFont.systemFontOfSize(12)
        phoneName.textAlignment = .Left
        phoneName.textColor = MainTextBackColor
        infoBackView.addSubview(phoneName)
        
        let adressHeaderImageView = UIImageView.init(image: UIImage(named:"ic_dizhi" ))
        adressHeaderImageView.frame = CGRectMake(10*px, personHeaderImageView.height+personHeaderImageView.frame.origin.y+5*px, 14*px, 15*px)
        infoBackView.addSubview(adressHeaderImageView)

        let adressName = UILabel.init(frame: CGRectMake(30*px, adressHeaderImageView.frame.origin.y, WIDTH-30*px, adressHeaderImageView.height))
        adressName.text = "山东省烟台市芝罘区上要花园"
        adressName.font = UIFont.systemFontOfSize(12)
        adressName.textAlignment = .Left
        adressName.textColor = MainTextBackColor
        infoBackView.addSubview(adressName)
        
        
        
        self.mainSCView.addSubview(infoBackView)
        self.view.addSubview(self.mainSCView)
        self.view.addSubview(backButton)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    
    
    //MARK:ACTION
    func backButtonAction(){
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

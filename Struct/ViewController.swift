//
//  ViewController.swift
//  Struct
//
//  Created by 太阳在线 on 16/9/21.
//  Copyright © 2016年 太阳在线. All rights reserved.
//

import UIKit
import Alamofire

enum CompassPoint: Int {
  case east = 0
  case west = 1
  case south = 2
  case north = 3
  case center = 4
  static func swithDirection(num:Int)->String {
    switch num {
    case 0:
      return "东"
    case 1:
      return "西"
    case 2:
      return "南"
    case 3:
      return "北"
    default:
      return "中"
   }
  }
  mutating func exchangDirection(num:Int){
    switch num {
    case 0:
      self = west
    case 1:
      self = south
    case 2:
      self = north
    case 3:
      self = center
    default:
      self = east
    }
  }
  
}

struct Resolution {
  var height = 0
  var width = 0
}


class ViewController: UIViewController {

  let direction = UILabel()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let item = ["东","西","南","北","中"]
    
    /// 我发现优势的风格定时关机
    let segment = UISegmentedControl(items: item)
    segment.frame = CGRectMake(0, 64, view.frame.width, 45)
    segment.selectedSegmentIndex = 0
    segment.tintColor = UIColor.purpleColor()
    segment.backgroundColor = UIColor.brownColor()
    segment.addTarget(self, action: #selector(selectIndex), forControlEvents: .ValueChanged)
    
    view.addSubview(segment)
    
    
    direction.center = CGPoint(x: view.frame.size.width / 2 - 50, y: view.frame.size.height / 2 - 50)
    direction.frame.size = CGSize(width: 100, height: 100)
    direction.backgroundColor = UIColor.cyanColor()
    direction.font = UIFont.systemFontOfSize(64)
   // direction.textColor = UIColor.redColor()
    direction.text = "东"
    direction.layer.cornerRadius = 50
    direction.layer.masksToBounds = true
    direction.textAlignment = .Center
    view.addSubview(direction)
    
    //这就是构造器  (逐一成员构造器 类没有的)
    let resolution = Resolution(height: 100, width: 50)
    print(resolution.height,resolution.width)
    var cinema = resolution
    cinema.height = 1080
    cinema.width = 2048
    print(cinema,resolution)
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  func studyEnum(paramters:CompassPoint) {
    switch paramters {
    case .east:
      print("东")
    case .north:
      print("北")
    case .south:
      print("南")
    case .west:
      print("西")
    default:
      print("中")
    }
  }
  
  func studyEnumInt(paramters:Int) ->String {
    switch paramters {
    case 0:
      return "东"
    case 1:
      return "西"
    case 2:
      return "南"
    case 3:
      return "北"
    default:
      return "中"
    }
  }
  
  func selectIndex(segment:UISegmentedControl) {
   // print(segment.selectedSegmentIndex)
    direction.text = studyEnumInt(segment.selectedSegmentIndex)
    
    let direct = CompassPoint.swithDirection(segment.selectedSegmentIndex)
    print(direct)
    
    
  }
  
  


}


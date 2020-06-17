//
//  UtilityExtensions.swift
//  AkbarTravels
//
//  Created by MAC01 on 17/01/18.
//  Copyright © 2018 Akbar Travels. All rights reserved.
//

import UIKit





extension NSAttributedString{
    
    func atrString(string: String, color: UIColor = .black, isBold: Bool = false, size: Float = 16)->NSAttributedString{
        
        let attribitedString = NSAttributedString(string: "\(string)", attributes: [NSAttributedString.Key.font: isBold ? UIFont.appBoldFont(fSize: size) : UIFont.appFont(fSize: size), NSAttributedString.Key.foregroundColor: color])
        
        return attribitedString
    }
    
}


extension UIView{
    
    
    func addAnchor(left: NSLayoutXAxisAnchor? = nil, _ leftSpacing: CGFloat? = nil, right: NSLayoutXAxisAnchor? = nil, _ rightSpacing: CGFloat? = nil, top: NSLayoutYAxisAnchor? = nil, _ topSpacing: CGFloat? = nil, bottom: NSLayoutYAxisAnchor? = nil, _ bottomSpacing: CGFloat? = nil, w: CGFloat? = nil, h: CGFloat? = nil) {
        
        if let leftAnchor = left {
            self.leadingAnchor.constraint(equalTo: leftAnchor, constant: leftSpacing ?? 0).isActive = true
        }
        
        if let rightAnchor = right{
            if let rightConst = rightSpacing{
                self.trailingAnchor.constraint(equalTo: rightAnchor, constant: -rightConst).isActive = true
            }else{
                self.trailingAnchor.constraint(equalTo: rightAnchor).isActive = true
            }
        }
        
        if let topAnchor = top {
            self.topAnchor.constraint(equalTo: topAnchor, constant: topSpacing ?? 0).isActive = true
        }
        
        if let bottomAnchor = bottom{
            if let bottomConst = bottomSpacing{
                self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomConst).isActive = true
            }else{
                self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            }
        }
        
        if let height = h{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = w{
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
    func addCenterAnchor(centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, top: NSLayoutYAxisAnchor? = nil, _ topSpacing: CGFloat? = nil, bottom: NSLayoutYAxisAnchor? = nil, _ bottomSpacing: CGFloat? = nil, w: CGFloat? = nil, h: CGFloat? = nil) {
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let topAnchor = top {
            self.topAnchor.constraint(equalTo: topAnchor, constant: topSpacing ?? 0).isActive = true
        }
        
        if let bottomAnchor = bottom{
            if let bottomConst = bottomSpacing{
                self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomConst).isActive = true
            }else{
                self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            }
        }
        
        if let height = h{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = w{
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
    
    func addTopLine() {
        DispatchQueue.main.async {
            let lineView = UIView()
            self.addSubview(lineView)
            lineView.noAutoConst()
            lineView.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2)
            lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            
        }
    }
    
    
    
    func addBottomLine() {
        DispatchQueue.main.async {
            
            let lineView = UIView()
            self.addSubview(lineView)
            lineView.noAutoConst()
            lineView.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2)
            lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    func addLeftLine() {
        DispatchQueue.main.async {
            
            let lineView = UIView()
            self.addSubview(lineView)
            lineView.noAutoConst()
            lineView.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2)
            lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    
    func addRightLine() {
        DispatchQueue.main.async {
            
            let lineView = UIView()
            self.addSubview(lineView)
            lineView.noAutoConst()
            lineView.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2)
            lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    func noAutoConst(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addDots(point: CGPoint) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let dotPath = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: 5.0, height: 5.0)))
        layer.path = dotPath.cgPath
        layer.strokeColor = UIColor.AppColor().cgColor
        layer.fillColor = UIColor.AppColor().cgColor
        return layer
    }
    
    func customCorner(corners: UIRectCorner, radius: CGFloat){
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii:CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
    }
    
    func addConstraintWithFormat(formate: String, views: UIView...){
        
        var viewDiectionary = [String: UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewDiectionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDiectionary))
        
    }
    
    func shakeWarning(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "position.x")
            anim.values = [ 0.0, 20.0, -20.0, 10.0, 0.0];
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3;
            anim.isAdditive = true;
            self.layer.add(anim, forKey: "shake")
        }
        
    }
    
    func makeShadowView(){
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 2
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.layer.backgroundColor = UIColor.white.cgColor  //UIColor.init(red: 172/255, green: 24/255, blue: 19/255, alpha: 1).cgColor
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 0
    }
    
    func makeCurve(curveAmount: CGFloat){
        
        self.backgroundColor = UIColor.clear
        let offset: CGFloat = self.frame.width / curveAmount
        let bounds: CGRect = self.bounds
        
        let viewRect: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: viewRect)
        
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size = self.frame.size
        
        // Gradient Color
        let topColor =  UIColor.rgba(r: 20, g: 77, b: 135, a: 1).cgColor
        let bottomColor = UIColor.rgba(r: 29, g: 95, b: 161, a: 1).cgColor
        
        gradient.colors = [topColor,bottomColor]
        self.layer.addSublayer(gradient)
        self.layer.mask = maskLayer
    }
    
    func addShapeLayer(fromPoint:CGPoint=CGPoint.zero,toPoint: CGPoint){
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [5, 3] // 5 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [fromPoint, toPoint])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}



extension UIButton {
    func setCornerRadius(){
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        
    }
}


extension String{
    
    func isValidEmailId() ->Bool{
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        
        let result = emailTest.evaluate(with: self)
        
        return result
        
    }
    
    func isValidPhoneNumber()->Bool{
        
        if self.count < 5 && self.count > 12 {
            return false
        }else{
            return true
        }
        
    }
    
    func isValidPinCode()->Bool{
        
        if self.count < 6{
            return false
        }else{
            return true
        }
        
    }
    func indicesOf(string: String) -> [Int] {
        var indices = [Int]()
        var searchStartIndex = self.startIndex
        
        while searchStartIndex < self.endIndex,
            let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
            !range.isEmpty
        {
            let index = distance(from: self.startIndex, to: range.lowerBound)
            indices.append(index)
            searchStartIndex = range.upperBound
        }
        
        return indices
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func checkPlural(count: Int, word: String) -> String {
        var filterWord = "\(count) \(word)"
        if  count > 1{
            
            switch word.lowercased() {
            case "adult":
                filterWord = "\(count) Adults"
            case "child":
                filterWord = "\(count) Children"
            case "infant":
                filterWord =  "\(count) Infants"
            default:
                return filterWord
            }
            
        }
        return filterWord
    }
}


extension Array where Element : Equatable{
    
    mutating func remove(object: Element){
        if let index = firstIndex(of: object){
            remove(at: index)
        }
    }
    
    func getIndex(_ value :  Element) -> [Int] {
        return self.indices.filter {self[$0] == value}
    }
    
}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

//Custom App Font
extension UIFont{
    
    
    class func appFont(fSize: Float) -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Regular", size: CGFloat(fSize))!
        
    }
    
    class func lblFont() -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Regular", size: 14)!
        
    }
    
    class func lblAppData() -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Regular", size: 17)!
        
    }
    
    class func appBoldFont(fSize: Float) -> UIFont{
        
        return UIFont(name: "RobotoCondensed-Bold", size: CGFloat(fSize))!
        
    }
    
}

extension UIColor{
    
    class func rgba(r: Float, g: Float, b: Float,a: Float) -> UIColor{
        return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(a))
    }
    
    class func AppColor() -> UIColor {
        return UIColor.rgba(r: 211, g: 47, b: 47, a: 1)
    }
    class func AppBlueColor() -> UIColor {
        return UIColor.rgba(r: 31, g: 70, b: 135, a: 1)
    }
    class func AppGreenColor() -> UIColor {
        return UIColor.rgba(r: 14, g: 115, b: 0, a: 1)
    }
    class func AppDarkBGColor() -> UIColor {
        return UIColor.rgba(r: 229, g: 230, b: 231, a: 1)
    }
    class func AppLiteBGColor() -> UIColor {
        return UIColor.rgba(r: 246, g: 247, b: 248, a: 1)
    }
    
    class func gradientBg(_ view : UIView) -> CAGradientLayer{
           let gradient: CAGradientLayer = CAGradientLayer()
           gradient.frame.size = view.frame.size
           gradient.colors = [self.rgba(r: 0, g: 0, b: 0, a: 0).cgColor,self.rgba(r: 0, g: 0, b: 0, a: 1).cgColor]
           return gradient
       }
       
    
    class func randomColor(_ alpha: CGFloat = 1)->UIColor {
           
           let r = Float(arc4random_uniform(255))
           let g = Float(arc4random_uniform(255))
           let b = Float(arc4random_uniform(255))
           
           return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: alpha)
       }
}



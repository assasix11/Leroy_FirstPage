//
//  ViewController.swift
//  Leroy_App
//
//  Created by Дмитрий Зубарев on 16.04.2021.
//

import UIKit

class ViewController: UIViewController {
    var firstHorizontalScroll: UIScrollView!
    var greenBackgroung: UIView!
    var greenHighBackground: UIView!
    var searchbar: UIView!
    var greenPartOfSearchLine: UIView!
    var heighhtofTapBar: CGFloat!
    var viewAboveSearchBar: UIView!
    var textOnSearchBar: UILabel!
    var y = 0
    var x = 31
    var p = 32
    var plusRectangles = 0
    var startPosition: CGFloat!
    var count = 1
    var plusSpace = 0
    var plusSpaceForSecond = 0
    var j = 0
    var heightOfBang: CGFloat!
    var yOfBang: CGFloat!
    var colorOfHightView: CGColor!
    var sizeOfFontOnSearchBar: CGFloat!
    var changeTextOnSearchBarPosition = 32
    var maxYOfSearhBar: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.main.scale)
        let massivePictures = ["greenMagnifire", "bookmark", "house", "person", "truck"]
        let tabBar = UITabBarController()
        let vc1 = SixViewController()
        vc1.title = "Главная"
        let vc2 = SecodViewController()
        vc2.title = "Мой список"
        let vc3 = ThirdViewController()
        vc3.title = "Магазины"
        let vc4 = FourthViewController()
        vc4.title = "Профиль"
        let vc5 = FifthViewController()
        vc5.title = "Корзина"
        tabBar.tabBar.barTintColor = .white
        tabBar.tabBar.layer.borderWidth = 1
        tabBar.tabBar.layer.borderColor = getUIColor(hex: "EAEAEA")?.cgColor
        tabBar.tabBar.tintColor = getUIColor(hex: "50CB3A")
        tabBar.tabBar.backgroundColor = getUIColor(hex: "FFFFFF")
        tabBar.tabBar.barTintColor = getUIColor(hex: "FFFFFF")
        tabBar.tabBar.layer.backgroundColor = getUIColor(hex: "FFFFFF")?.cgColor
        tabBar.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
        for i in tabBar.tabBar.items! {
            i.image = UIImage(named: massivePictures[j])
            j = j + 1
        }
        view.addSubview(tabBar.view)
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                    //print("iPhone 5 or 5S or 5C")
                    heighhtofTapBar = tabBar.tabBar.layer.bounds.height

            case 1334:
                    //print("iPhone 6/6S/7/8")
                    heighhtofTapBar = tabBar.tabBar.layer.bounds.height

            case 1920, 2208:
                    //print("iPhone 6+/6S+/7+/8+")
                    heighhtofTapBar = tabBar.tabBar.layer.bounds.height

            case 2436:
                    //print("iPhone X/XS/11 Pro")
                    heighhtofTapBar = pixelsToPoints(pixels: 167)

            case 2688, 2778:
                    //print("iPhone XS Max/11 Pro Max/12 Pro Max")
                    heighhtofTapBar = pixelsToPoints(pixels: 167)

            case 1792:
                    //print("iPhone XR/ 11 ")
                    heighhtofTapBar = pixelsToPoints(pixels: 167)
            default:
                    //print("Unknown")
                    heighhtofTapBar = pixelsToPoints(pixels: 167)
            }
        } else {
                switch UIScreen.main.nativeBounds.height {
                case 2732:
                    //print("ipad 12.9")
                    heighhtofTapBar = pixelsToPoints(pixels: 200)
                case 2388:
                    //print("ipad 11")
                    heighhtofTapBar = pixelsToPoints(pixels: 200)
                case 2360:
                     //print("ipad air 11")
                     heighhtofTapBar = pixelsToPoints(pixels: 200)
                default:
                    heighhtofTapBar = tabBar.tabBar.layer.bounds.height
                }
            }

        let scrollVertical = UIScrollView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.height - heighhtofTapBar))
        scrollVertical.showsVerticalScrollIndicator = false
        scrollVertical.contentSize = CGSize(width: scrollVertical.bounds.width,
                                            height: pixelsToPoints(pixels: 2286-40 - 98))
        scrollVertical.backgroundColor = .white
        scrollVertical.tag = 1
        view.addSubview(tabBar.view)
        view.addSubview(scrollVertical)
        greenHighBackground = UIView(frame: CGRect(x: 0,
                                                   y: -UIScreen.main.bounds.height*2,
                                                   width: UIScreen.main.bounds.width,
                                                   height: UIScreen.main.bounds.height*2 + pixelsToPoints(pixels: 10)))
        greenHighBackground.backgroundColor = getUIColor(hex: "52C440")
        scrollVertical.addSubview(greenHighBackground)
        greenBackgroung = UIView(frame: CGRect(x: 0,
                                               y: -pixelsToPoints(pixels: 40),
                                               width: UIScreen.main.bounds.width,
                                               height: pixelsToPoints(pixels: 432)))
        greenBackgroung.backgroundColor = getUIColor(hex: "52C440")
        scrollVertical.addSubview(greenBackgroung)
        scrollVertical.delegate = self
        searchbar = UIView(frame: CGRect(x: pixelsToPoints(pixels: 31),
                                         y: pixelsToPoints(pixels: 272-40),
                                         width: UIScreen.main.bounds.width - pixelsToPoints(pixels: 192),
                                         height: pixelsToPoints(pixels: 97)))
        searchbar.backgroundColor = getUIColor(hex: "FFFFFF")
        searchbar.layer.cornerRadius = 5
        viewAboveSearchBar = UIView(frame: CGRect(x: 0,
                                                  y: pixelsToPoints(pixels: 272-80),
                                                  width: UIScreen.main.bounds.width,
                                                  height: pixelsToPoints(pixels: 40)))
        viewAboveSearchBar.backgroundColor = getUIColor(hex: "D4D4D4")
        viewAboveSearchBar.alpha = 0.0
        textOnSearchBar = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 35),
                                                y: pixelsToPoints(pixels: 32),
                                                width: pixelsToPoints(pixels: 160),
                                                height: pixelsToPoints(pixels: 33)))
        textOnSearchBar.font = UIFont(name: "Inter-Regular", size: pixelsToPoints(pixels: 33))
        textOnSearchBar.textColor = getUIColor(hex: "A9A9A9")
        textOnSearchBar.text = "Поиск"
        let mainText = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 35),
                                             y: pixelsToPoints(pixels: 165),
                                             width: pixelsToPoints(pixels: 515),
                                             height: pixelsToPoints(pixels: 72)))
        mainText.text = "Поиск товаров"
        mainText.textColor = .white
        mainText.font = UIFont(name: "Inter-Bold", size: pixelsToPoints(pixels: 66))
        greenBackgroung.addSubview(mainText)
        let barCode = UIView(frame: CGRect(x: UIScreen.main.bounds.width - pixelsToPoints(pixels: 128),
                                           y: pixelsToPoints(pixels: 272),
                                           width: pixelsToPoints(pixels: 96),
                                           height: pixelsToPoints(pixels: 97)))
        barCode.backgroundColor = .white
        let barCodeImage = UIImageView(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                     y: pixelsToPoints(pixels: 31),
                                                     width: pixelsToPoints(pixels: 42),
                                                     height: pixelsToPoints(pixels: 34)))
        let barCodeImageView = UIImage(named: "barcode")
        barCodeImage.image = barCodeImageView
        barCode.layer.cornerRadius = 5
        barCode.addSubview(barCodeImage)
        greenBackgroung.addSubview(barCode)
        greenPartOfSearchLine = UIView(frame: CGRect(x: searchbar.layer.bounds.width - pixelsToPoints(pixels: 104),
                                                     y: pixelsToPoints(pixels: 8),
                                                     width: pixelsToPoints(pixels: 96),
                                                     height: pixelsToPoints(pixels: 80)))
        greenPartOfSearchLine.backgroundColor = getUIColor(hex: "61CB50")
        greenPartOfSearchLine.layer.cornerRadius = 5
        searchbar.addSubview(greenPartOfSearchLine)
        let magnifire = UIImageView(frame: CGRect(x: pixelsToPoints(pixels: 36),
                                                  y: pixelsToPoints(pixels: 28),
                                                  width: pixelsToPoints(pixels: 25), height:
                                                  pixelsToPoints(pixels: 25)))
        let magnifireView = UIImage(named: "magnifire")
        magnifire.image = magnifireView
        greenPartOfSearchLine.addSubview(magnifire)
        firstHorizontalScroll = UIScrollView(frame: CGRect(x: 0,
                                                           y: pixelsToPoints(pixels: 496 - 40),
                                                           width: UIScreen.main.bounds.width,
                                                           height: pixelsToPoints(pixels: 250)))
        firstHorizontalScroll.contentSize = CGSize(width: pixelsToPoints(pixels: 2027),
                                                   height: pixelsToPoints(pixels: 250))
        firstHorizontalScroll.showsHorizontalScrollIndicator = false
        firstHorizontalScroll.backgroundColor = .white
        firstHorizontalScroll.tag = 2
        firstHorizontalScroll.delegate = self
        scrollVertical.addSubview(firstHorizontalScroll)
        let firstSquare = UIView(frame: CGRect(x: pixelsToPoints(pixels: 33),
                                               y: 0,
                                               width: pixelsToPoints(pixels: 256),
                                               height: pixelsToPoints(pixels: 248)))
        firstSquare.backgroundColor = getUIColor(hex: "61CB4F")
        firstSquare.layer.cornerRadius = 5
        firstHorizontalScroll.addSubview(firstSquare)
        let whiteRectangles = UIImageView(frame: CGRect(x: pixelsToPoints(pixels: 173),
                                                        y: pixelsToPoints(pixels: 168),
                                                        width: pixelsToPoints(pixels: 54),
                                                        height: pixelsToPoints(pixels: 45)))
        let whiteRectanglesView = UIImage(named: "whiteRectangles")
        whiteRectangles.image = whiteRectanglesView
        firstSquare.addSubview(whiteRectangles)
        let textOnFirstRectangle = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                         y: pixelsToPoints(pixels: 31),
                                                         width: pixelsToPoints(pixels: 150),
                                                         height: pixelsToPoints(pixels: 34)))
        textOnFirstRectangle.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 34))
        textOnFirstRectangle.textColor = .white
        textOnFirstRectangle.text = "Каталог"
        firstSquare.addSubview(textOnFirstRectangle)
        let secondSquare = UIView(frame: CGRect(x: pixelsToPoints(pixels: 33 + 28 + 256),
                                                y: 0,
                                                width: pixelsToPoints(pixels: 256),
                                                height: pixelsToPoints(pixels: 248)))
        secondSquare.backgroundColor = getUIColor(hex: "F2F3F5")
        secondSquare.layer.cornerRadius = 5
        firstHorizontalScroll.addSubview(secondSquare)
        let ImageOnSecodSquare = UIImageView(frame: CGRect(x: secondSquare.bounds.width - pixelsToPoints(pixels: 174),
                                                           y: secondSquare.bounds.height - pixelsToPoints(pixels: 176),
                                                           width: pixelsToPoints(pixels: 174),
                                                           height: pixelsToPoints(pixels: 176)))
        let ImageOnSecodSquareView = UIImage(named: "green")
        ImageOnSecodSquare.image = ImageOnSecodSquareView
        secondSquare.addSubview(ImageOnSecodSquare)
        let textOnSecondRectangle = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                          y: pixelsToPoints(pixels: 30),
                                                          width: pixelsToPoints(pixels: 150),
                                                          height: pixelsToPoints(pixels: 30)))
        textOnSecondRectangle.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 30))
        textOnSecondRectangle.textColor = .black
        textOnSecondRectangle.text = "Сад"
        secondSquare.addSubview(textOnSecondRectangle)
        let thirdSquare = UIView(frame: CGRect(x: pixelsToPoints(pixels: 33 + 28 + 256 + 28 + 256),
                                               y: 0,
                                               width: pixelsToPoints(pixels: 256),
                                               height: pixelsToPoints(pixels: 248)))
        thirdSquare.backgroundColor = getUIColor(hex: "F2F3F5")
        thirdSquare.layer.cornerRadius = 5
        firstHorizontalScroll.addSubview(thirdSquare)
        let ImageOnThirdSquare = UIImageView(frame: CGRect(x: thirdSquare.bounds.width - pixelsToPoints(pixels: 151),
                                                           y: thirdSquare.bounds.height - pixelsToPoints(pixels: 176),
                                                           width: pixelsToPoints(pixels: 151),
                                                           height: pixelsToPoints(pixels: 176)))
        let ImageOnThirdSquareView = UIImage(named: "brown")
        ImageOnThirdSquare.image = ImageOnThirdSquareView
        thirdSquare.addSubview(ImageOnThirdSquare)
        let textOnThirdRectangle = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                         y: pixelsToPoints(pixels: 30),
                                                         width: pixelsToPoints(pixels: 200),
                                                         height: pixelsToPoints(pixels: 30)))
        textOnThirdRectangle.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 30))
        textOnThirdRectangle.textColor = .black
        textOnThirdRectangle.text = "Освещение"
        thirdSquare.addSubview(textOnThirdRectangle)
        let fourthSquare = UIView(frame: CGRect(x: pixelsToPoints(pixels: 33 + 28 + 256 + 28 + 256 + 28 + 256),
                                                y: 0,
                                                width: pixelsToPoints(pixels: 256),
                                                height: pixelsToPoints(pixels: 248)))
        fourthSquare.backgroundColor = getUIColor(hex: "F2F3F5")
        fourthSquare.layer.cornerRadius = 5
        firstHorizontalScroll.addSubview(fourthSquare)
        let ImageOnfourhSquare = UIImageView(frame: CGRect(x: fourthSquare.bounds.width - pixelsToPoints(pixels: 169),
                                                           y: fourthSquare.bounds.height - pixelsToPoints(pixels: 176),
                                                           width: pixelsToPoints(pixels: 169),
                                                           height: pixelsToPoints(pixels: 176)))
        let ImageOnfourhSquareView = UIImage(named: "blue")
        ImageOnfourhSquare.image = ImageOnfourhSquareView
        fourthSquare.addSubview(ImageOnfourhSquare)
        let textOnFourthRectangle = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                          y: pixelsToPoints(pixels: 30),
                                                          width: pixelsToPoints(pixels: 250),
                                                          height: pixelsToPoints(pixels: 30)))
        textOnFourthRectangle.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 30))
        textOnFourthRectangle.textColor = .black
        textOnFourthRectangle.text = "Инструменты"
        fourthSquare.addSubview(textOnFourthRectangle)
        let fifthSquare = UIView(frame: CGRect(x: pixelsToPoints(pixels: 33 + 28 + 256 + 28 + 256 + 28 + 256 + 28 + 256),
                                               y: 0,
                                               width: pixelsToPoints(pixels: 256),
                                               height: pixelsToPoints(pixels: 248)))
        fifthSquare.backgroundColor = getUIColor(hex: "F2F3F5")
        fifthSquare.layer.cornerRadius = 5
        firstHorizontalScroll.addSubview(fifthSquare)
        let ImageOnfifthSquare = UIImageView(frame: CGRect(x: fifthSquare.bounds.width - pixelsToPoints(pixels: 165),
                                                           y: fifthSquare.bounds.height - pixelsToPoints(pixels: 148),
                                                           width: pixelsToPoints(pixels: 165),
                                                           height: pixelsToPoints(pixels: 148)))
        let ImageOnfifthSquareView = UIImage(named: "red")
        ImageOnfifthSquare.image = ImageOnfifthSquareView
        fifthSquare.addSubview(ImageOnfifthSquare)
        let textOnFifthRectangle = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                         y: pixelsToPoints(pixels: 30),
                                                         width: pixelsToPoints(pixels: 200),
                                                         height: pixelsToPoints(pixels: 30)))
        textOnFifthRectangle.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 30))
        textOnFifthRectangle.textColor = .black
        textOnFifthRectangle.text = "Строймате-"
        fifthSquare.addSubview(textOnFifthRectangle)
        let textOnFifthRectanglePlus = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                             y: pixelsToPoints(pixels: 65),
                                                             width: pixelsToPoints(pixels: 200),
                                                             height: pixelsToPoints(pixels: 30)))
        textOnFifthRectanglePlus.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 30))
        textOnFifthRectanglePlus.textColor = .black
        textOnFifthRectanglePlus.text = "риалы"
        fifthSquare.addSubview(textOnFifthRectanglePlus)
        let sixSquare = UIView(frame: CGRect(x: pixelsToPoints(pixels: 33 + 28 + 256 + 28 + 256 + 28 + 256 + 28 + 256 + 28 + 256),
                                             y: 0,
                                             width: pixelsToPoints(pixels: 256),
                                             height: pixelsToPoints(pixels: 248)))
        sixSquare.backgroundColor = getUIColor(hex: "F2F3F5")
        sixSquare.layer.cornerRadius = 5
        firstHorizontalScroll.addSubview(sixSquare)
        let ImageOnSixSquare = UIImageView(frame: CGRect(x: sixSquare.bounds.width - pixelsToPoints(pixels: 170),
                                                         y: sixSquare.bounds.height - pixelsToPoints(pixels: 148),
                                                         width: pixelsToPoints(pixels: 170),
                                                         height: pixelsToPoints(pixels: 148)))
        let ImageOnSixSquareView = UIImage(named: "purple")
        ImageOnSixSquare.image = ImageOnSixSquareView
        sixSquare.addSubview(ImageOnSixSquare)
        let textOnSixRectangle = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                       y: pixelsToPoints(pixels: 30),
                                                       width: pixelsToPoints(pixels: 200),
                                                       height: pixelsToPoints(pixels: 30)))
        textOnSixRectangle.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 30))
        textOnSixRectangle.textColor = .black
        textOnSixRectangle.text = "Декор"
        sixSquare.addSubview(textOnSixRectangle)
        let sevenSquare = UIView(frame: CGRect(x: pixelsToPoints(pixels: 33 + 28 + 256 + 28 + 256 + 28 + 256 + 28 + 256 + 28 + 256 + 28 + 256),
                                               y: 0,
                                               width: pixelsToPoints(pixels: 256),
                                               height: pixelsToPoints(pixels: 248)))
        sevenSquare.backgroundColor = getUIColor(hex: "F2F3F5")
        sevenSquare.layer.cornerRadius = 5
        firstHorizontalScroll.addSubview(sevenSquare)
        let squareOnSeven = UIImageView(frame: CGRect(x: pixelsToPoints(pixels: 87),
                                                      y: pixelsToPoints(pixels: 57),
                                                      width: pixelsToPoints(pixels: 80),
                                                      height: pixelsToPoints(pixels: 80)))
        let squareOnSevenView = UIImage(named: "greenSquare")
        squareOnSeven.image = squareOnSevenView
        sevenSquare.addSubview(squareOnSeven)
        let textOnSevenRectangle = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 27),
                                                         y: pixelsToPoints(pixels: 153),
                                                         width: pixelsToPoints(pixels: 250),
                                                         height: pixelsToPoints(pixels: 30)))
        textOnSevenRectangle.font = UIFont(name: "Inter-Medium", size: pixelsToPoints(pixels: 30))
        textOnSevenRectangle.textColor = .black
        textOnSevenRectangle.text = "Смотреть все"
        sevenSquare.addSubview(textOnSevenRectangle)
        let secondText = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 33),
                                               y: pixelsToPoints(pixels: 824),
                                               width: pixelsToPoints(pixels: 615),
                                               height: pixelsToPoints(pixels: 45)))
        secondText.text = "Предложение ограничено"
        secondText.textColor = getUIColor(hex: "333333")
        secondText.font = UIFont(name: "Inter-Bold", size: pixelsToPoints(pixels: 43))
        scrollVertical.addSubview(secondText)
        let secondHorizontalScroll = UIScrollView(frame: CGRect(x: 0,
                                                                y: pixelsToPoints(pixels: 989 - 40 - 51),
                                                                width: UIScreen.main.bounds.width,
                                                                height: pixelsToPoints(pixels: 475)))
        secondHorizontalScroll.tag = 3
        secondHorizontalScroll.showsHorizontalScrollIndicator = false
        secondHorizontalScroll.contentSize = CGSize(width: pixelsToPoints(pixels: 5738),
                                                    height: pixelsToPoints(pixels: 475))
        secondHorizontalScroll.delegate = self
        scrollVertical.addSubview(secondHorizontalScroll)
        for i in 1...19 {
            let product = Factory.factory
            let massive = product.createMassive()
            let square = UIView(frame: CGRect(x: pixelsToPoints(pixels: plusSpace),
                                              y: 0,
                                              width: pixelsToPoints(pixels: 302),
                                              height: pixelsToPoints(pixels: 475)))
            square.layer.cornerRadius = 5
            let picture = UIImageView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: pixelsToPoints(pixels: 302),
                                                    height: pixelsToPoints(pixels: 324)))
            picture.image = massive[i].image
            square.addSubview(picture)
            let price = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 33),
                                              y: pixelsToPoints(pixels: 300),
                                              width: pixelsToPoints(pixels: 229),
                                              height: 50))
            price.text = "\(String(massive[i].price)) ₽/шт."
            price.textColor = getUIColor(hex: "333333")
            price.font = UIFont(name: "Inter-Bold", size: pixelsToPoints(pixels: 37))
            let littePrice = UIFont(name: "Inter-Bold", size: pixelsToPoints(pixels: 24))
            let littlePriceAttributes : [NSAttributedString.Key : Any] = [.font: littePrice as Any]
            var numberOfSpace = Int()
            var counter = Int()
            for i in price.text! {
                counter = counter + 1
                if i == " " {
                    numberOfSpace = counter
                }
            }
            let newPrice = NSMutableAttributedString(string: price.text!)
            newPrice.addAttributes(littlePriceAttributes, range: NSRange(location: numberOfSpace, length: 5))
            price.attributedText = newPrice
            square.addSubview(price)
            let textOf = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 33),
                                               y: pixelsToPoints(pixels: 387),
                                               width: pixelsToPoints(pixels: 229),
                                               height: pixelsToPoints(pixels: 67)))
            textOf.text = massive[i].Description
            textOf.font = UIFont(name: "Inter-Regular", size: pixelsToPoints(pixels: 26))
            textOf.textColor = getUIColor(hex: "333333")
            textOf.numberOfLines = 2
            square.addSubview(textOf)
            secondHorizontalScroll.addSubview(square)
            plusSpace = plusSpace + 302
        }
        let thirdText = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 33), y: pixelsToPoints(pixels: 1553-40), width: pixelsToPoints(pixels: 615), height: pixelsToPoints(pixels: 45)))
        thirdText.text = "Лучшая цена"
        thirdText.textColor = getUIColor(hex: "333333")
        thirdText.font = UIFont(name: "Inter-Bold", size: pixelsToPoints(pixels: 43))
        scrollVertical.addSubview(thirdText)
        let thirdHorizontalScroll = UIScrollView(frame: CGRect(x: 0,
                                                               y: pixelsToPoints(pixels: 1553 - 40 + 109 - 38),
                                                               width: UIScreen.main.bounds.width,
                                                               height: pixelsToPoints(pixels: 475)))
        thirdHorizontalScroll.tag = 3
        thirdHorizontalScroll.showsHorizontalScrollIndicator = false
        thirdHorizontalScroll.delegate = self
        thirdHorizontalScroll.contentSize = CGSize(width: pixelsToPoints(pixels: 5738),
                                                   height: pixelsToPoints(pixels: 475))
        scrollVertical.addSubview(thirdHorizontalScroll)
        for i in 1...19 {
            let product = Factory.factory
            let massive = product.productMassiveForSecondScroll
            let square = UIView(frame: CGRect(x: pixelsToPoints(pixels: plusSpaceForSecond),
                                              y: 0,
                                              width: pixelsToPoints(pixels: 302),
                                              height: pixelsToPoints(pixels: 474)))
            square.layer.cornerRadius = 5
            let picture = UIImageView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: pixelsToPoints(pixels: 302),
                                                    height: pixelsToPoints(pixels: 324)))
            picture.image = massive[i].image
            square.addSubview(picture)
            let price = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 33),
                                              y: pixelsToPoints(pixels: 300),
                                              width: pixelsToPoints(pixels: 229),
                                              height: 50))
            price.text = "\(String(massive[i].price)) ₽/шт."
            price.textColor = getUIColor(hex: "333333")
            price.font = UIFont(name: "Inter-Bold", size: pixelsToPoints(pixels: 37))
            let littePrice = UIFont(name: "Inter-Bold", size: pixelsToPoints(pixels: 24))
            let littlePriceAttributes : [NSAttributedString.Key : Any] = [.font: littePrice as Any]
            var numberOfSpace = Int()
            var counter = Int()
            for i in price.text! {
                counter = counter + 1
                if i == " " {
                    numberOfSpace = counter
                }
            }
            let newPrice = NSMutableAttributedString(string: price.text!)
            newPrice.addAttributes(littlePriceAttributes, range: NSRange(location: numberOfSpace, length: 5))
            price.attributedText = newPrice
            square.addSubview(price)
            let textOf = UILabel(frame: CGRect(x: pixelsToPoints(pixels: 33),
                                               y: pixelsToPoints(pixels: 390),
                                               width: pixelsToPoints(pixels: 229),
                                               height: pixelsToPoints(pixels: 67)))
            textOf.text = massive[i].Description
            textOf.font = UIFont(name: "Inter-Regular", size: pixelsToPoints(pixels: 26))
            textOf.textColor = getUIColor(hex: "333333")
            textOf.numberOfLines = 2
            square.addSubview(textOf)
            thirdHorizontalScroll.addSubview(square)
            plusSpaceForSecond = plusSpaceForSecond + 302
        }
        scrollVertical.addSubview(searchbar)
        scrollVertical.addSubview(viewAboveSearchBar)
        searchbar.addSubview(textOnSearchBar)
    }
    func getUIColor(hex: String, alpha: Double = 1.0) -> UIColor? {
        var cleanString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cleanString.hasPrefix("#") {
            cleanString.remove(at: cleanString.startIndex)
        }

        if (cleanString.count) != 6 {
            return nil
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cleanString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func pixelsToPoints(pixels : Int) -> CGFloat {
        return CGFloat(pixels) / 2
        }

}

class SecodViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class ThirdViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class FourthViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class FifthViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class SixViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



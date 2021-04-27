//
//  Extension.swift
//  Leroy_App
//
//  Created by Дмитрий Зубарев on 18.04.2021.
//

import UIKit

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 1 {
            if UIDevice().userInterfaceIdiom == .phone {
                switch UIScreen.main.nativeBounds.height {
                case 1136:
                    //print("iPhone 5 or 5S or 5C")
                    heightOfBang = pixelsToPoints(pixels: 42)
                    yOfBang = 20
                    colorOfHightView = getUIColor(hex: "D4D4D4")?.cgColor
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 33)
                case 1334:
                    //print("iPhone 6/6S/7/8")
                    heightOfBang = pixelsToPoints(pixels: 42)
                    yOfBang = 20
                    colorOfHightView = getUIColor(hex: "FFFFFF")?.cgColor
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 33)
                case 1920, 2208:
                    //print("iPhone 6+/6S+/7+/8+")
                    heightOfBang = pixelsToPoints(pixels: 42)
                    yOfBang = 20
                    colorOfHightView = getUIColor(hex: "FFFFFF")?.cgColor
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 33)
                case 2436:
                    //print("iPhone X/XS/11 Pro")
                    heightOfBang = pixelsToPoints(pixels: 108)
                    yOfBang = pixelsToPoints(pixels: 88)
                    colorOfHightView = getUIColor(hex: "FFFFFF")?.cgColor
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 38)
                case 2688, 2778, 2340, 2532:
                    //print("iPhone XS Max/11 Pro Max/12 Pro Max/mini")
                    heightOfBang = pixelsToPoints(pixels: 108)
                    yOfBang = pixelsToPoints(pixels: 88)
                    colorOfHightView = getUIColor(hex: "FFFFFF")?.cgColor
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 38)
                case 1792:
                    //print("iPhone XR/ 11 ")
                    heightOfBang = pixelsToPoints(pixels: 108)
                    yOfBang = pixelsToPoints(pixels: 88)
                    colorOfHightView = getUIColor(hex: "FFFFFF")?.cgColor
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 38)
                    //maxYOfSearhBar = 272 - 40 + 48
                default:
                    heightOfBang = pixelsToPoints(pixels: 42)
                    yOfBang = 20
                    colorOfHightView = getUIColor(hex: "D4D4D4")?.cgColor
                    //print("Unknown")
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 33)
                }
                textOnSearchBar.font = UIFont(name: "Inter-Regular", size: sizeOfFontOnSearchBar)
            } else {
                    heightOfBang = pixelsToPoints(pixels: 42)
                    yOfBang = 20
                    colorOfHightView = getUIColor(hex: "FFFFFF")?.cgColor
                    sizeOfFontOnSearchBar = pixelsToPoints(pixels: 33)
                    }
            if scrollView.contentOffset.y < 100 {
                            let alphaOne = 1 - scrollView.contentOffset.y * 0.02
                                greenBackgroung.alpha = alphaOne
                                greenHighBackground.alpha = alphaOne
                                greenPartOfSearchLine.alpha = alphaOne
                            } else {
                                greenBackgroung.alpha = 0.0
                                greenHighBackground.alpha = 0.0
                                greenPartOfSearchLine.alpha = 0.0
                            }
            if scrollView.contentOffset.y > 50 || x <= 30 {
                x = Int(31 - (scrollView.contentOffset.y - 50))
                                    if scrollView.contentOffset.y + yOfBang < pixelsToPoints(pixels: 232) {
                                        maxYOfSearhBar = pixelsToPoints(pixels: 232)
                                    } else {
                                        maxYOfSearhBar = scrollView.contentOffset.y + yOfBang
                                    }
                if x >= 0 {
                    if x > 31 {
                        x = 31
                searchbar.frame = CGRect(x: pixelsToPoints(pixels: Int(x)),
                                            y: maxYOfSearhBar,
                                            width: UIScreen.main.bounds.width - pixelsToPoints(pixels: 192),
                                            height: pixelsToPoints(pixels: 97))
                    } else if x == 0 {
                        searchbar.frame = CGRect(x: pixelsToPoints(pixels: Int(x)),
                                                    y: maxYOfSearhBar,
                                                    width: UIScreen.main.bounds.width,
                                                    height: pixelsToPoints(pixels: 97))
                    } else {
                        searchbar.frame = CGRect(x: pixelsToPoints(pixels: Int(x)),
                                                    y: maxYOfSearhBar,
                                                    width: UIScreen.main.bounds.width - pixelsToPoints(pixels: 192),
                                                    height: pixelsToPoints(pixels: 97))
                    }
                } else {
                    searchbar.frame = CGRect(x: pixelsToPoints(pixels: 0),
                                                y: maxYOfSearhBar,
                                                width: UIScreen.main.bounds.width - pixelsToPoints(pixels: 192),
                                                height: pixelsToPoints(pixels: 97))
        }
                }
        if scrollView.contentOffset.y + 20 >= pixelsToPoints(pixels: 272-40) {
            searchbar.frame = CGRect(x: pixelsToPoints(pixels: 0),
                                     y: scrollView.contentOffset.y + yOfBang ,
                                     width: UIScreen.main.bounds.width ,
                                     height: pixelsToPoints(pixels: 118))
            viewAboveSearchBar.frame = CGRect(x: pixelsToPoints(pixels: 0),
                                              y: scrollView.contentOffset.y ,
                                              width: UIScreen.main.bounds.width ,
                                              height: heightOfBang)
                textOnSearchBar.frame = CGRect(x: pixelsToPoints(pixels: 35),
                                               y: pixelsToPoints(pixels: 34),
                                               width: pixelsToPoints(pixels: 160),
                                               height: pixelsToPoints(pixels: 33))
            print(textOnSearchBar.frame)
            searchbar.layer.cornerRadius = 0
            textOnSearchBar.font = UIFont(name: "Inter-Regular", size: sizeOfFontOnSearchBar)
            viewAboveSearchBar.alpha = 1.0
            viewAboveSearchBar.layer.backgroundColor = UIColor.white.cgColor
            searchbar.layer.shadowColor = UIColor.black.cgColor
            searchbar.layer.shadowOpacity = 0.2
            searchbar.layer.shadowOffset = .zero
            searchbar.layer.shadowRadius = 3
        } else if scrollView.contentOffset.y < pixelsToPoints(pixels: 272-40) {
            searchbar.layer.shadowOpacity = 0.0
            viewAboveSearchBar.alpha = 0.0
            textOnSearchBar.frame = CGRect(x: pixelsToPoints(pixels: 35),
                                           y: pixelsToPoints(pixels: 32),
                                           width: pixelsToPoints(pixels: 160),
                                           height: pixelsToPoints(pixels: 33))
            changeTextOnSearchBarPosition = 32
            searchbar.layer.cornerRadius = 5
        }
        if scrollView.contentOffset.y == -20 {
            y = 0
        }
    }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView.tag == 2 {
        scrollViewWillBeginDragging(scrollView)
        let cellWidthIncludingSpacing = CGFloat(pixelsToPoints(pixels: 256) + pixelsToPoints(pixels: 28))
        var offset  = targetContentOffset.pointee
            if startPosition > 693.5 || (startPosition < 0 && offset.x == 0) {
                return
            }
        let index = (startPosition + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            if offset.x - startPosition > pixelsToPoints(pixels: (256 + 28)*4) {
                plusRectangles = 1
            } else if offset.x - startPosition < pixelsToPoints(pixels: (256 + 28)*4) && offset.x - startPosition > 0 {
                plusRectangles = 0
            } else if offset.x - startPosition < 0 && offset.x - startPosition < -pixelsToPoints(pixels: (256 + 28)*2) {
                plusRectangles = -1
            } else if offset.x - startPosition < 0 && offset.x - startPosition > -pixelsToPoints(pixels: (256 + 28)*2) {
                plusRectangles = -1
            }
            let finalRectangeles = roundedIndex + CGFloat(plusRectangles)
            if finalRectangeles > 5 {
                return
            }
            offset = CGPoint(x: (finalRectangeles) * cellWidthIncludingSpacing + pixelsToPoints(pixels: 5),
                             y:  scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        }
        if scrollView.tag == 3 {
        scrollViewWillBeginDragging(scrollView)
        let cellWidthIncludingSpacing = CGFloat(pixelsToPoints(pixels: 302))
        var offset  = targetContentOffset.pointee
            if startPosition > 2549 || (startPosition < 0 && offset.x == 0) {
                return
            }
        let index = (startPosition + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            if offset.x - startPosition > pixelsToPoints(pixels: (302)*Int(6)) {
                plusRectangles = 1
            } else if offset.x - startPosition < pixelsToPoints(pixels: (302)*Int(6)) && offset.x - startPosition > 0 {
                plusRectangles = 0
            } else if offset.x - startPosition < 0 && offset.x - startPosition < -pixelsToPoints(pixels: (302)*2) {
                plusRectangles = -1
            } else if offset.x - startPosition < 0 && offset.x - startPosition > -pixelsToPoints(pixels: (302)*2) {
                plusRectangles = -1
            }
            let finalRectangeles = roundedIndex + CGFloat(plusRectangles)
            if finalRectangeles > 19 {
                return
            }
            offset = CGPoint(x: (finalRectangeles) * cellWidthIncludingSpacing,
                             y:  scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        }
        if scrollView.tag == 1 {
        scrollViewWillBeginDragging(scrollView)
        var offset  = targetContentOffset.pointee
            var magneticPoint: CGFloat!
            switch UIScreen.main.nativeBounds.height {
            case 2688, 2778, 1792, 2436, 2340, 2532:
                magneticPoint = 105

            default:
                magneticPoint = 133
            }

            if targetContentOffset.pointee.y > 50 && targetContentOffset.pointee.y < magneticPoint {
                offset = CGPoint(x: 0, y: magneticPoint)
            } else if targetContentOffset.pointee.y < 50 {
                offset = CGPoint(x: 0, y: -20)
            } else {
                return
            }
        targetContentOffset.pointee = offset
        }

    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startPosition = scrollView.contentOffset.x
    }
}

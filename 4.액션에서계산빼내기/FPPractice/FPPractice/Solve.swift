//
//  Solve.swift
//  FPPractice
//
//  Created by Mason on 2023/06/21.
//

import Foundation

class Solve {
    
    var shoppingCart = [Item]()
    var shoppingCartTotal: Double = 0

    // A
    func addItemToCart(
        name: String,
        price: Double
    ) {
        shoppingCart = addItem(cart: shoppingCart, name: name, price: price)
        calcCartTotal()
    }
    
    // A
    func calcCartTotal() {
        shoppingCartTotal = calcTotal(cart: shoppingCart)
        
        setCartTotalDom()
        updateShippingIcons()
        updateTaxDom()
    }
        
    // A
    func updateShippingIcons() {
        func getBuyButtonsDom() -> [Button] { [] }
        
        var buyButtons = getBuyButtonsDom()
        for button in buyButtons {
            if getFreeShopping(itemPrice: button.item.price, total: shoppingCartTotal) {
                button.showFreeShippingIcon()
            } else {
                button.hideFreeShippingIcon()
            }
        }
    }

    // A
    func updateTaxDom() {
        setTaxDom(price: calcTax(amount: shoppingCartTotal))
    }
    
    // C
    func addItem(
        cart: [Item],
        name: String,
        price: Double
    ) -> [Item] {
        var newCart = cart
        newCart.append(
            .init(
                name: name,
                price: price
            )
        )
        return newCart
    }
    
    // 암묵적 출력 없애기 (전역변수 > 지역변수)
    // 암묵적 입력 없애기 (암묵적 입력 > 함수인자)
    // C
    func calcTotal(cart: [Item]) -> Double {
        var total: Double = 0.0
        for item in cart {
            total += item.price
        }
        
        return total
    }

    // C
    func getFreeShopping(itemPrice: Double, total: Double) -> Bool {
        return itemPrice + total >= 20
    }
    
    // C
    func calcTax(amount: Double) -> Double {
        return amount * 0.10
    }
}

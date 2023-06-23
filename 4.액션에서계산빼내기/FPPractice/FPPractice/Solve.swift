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
        
        shoppingCart = addItem(cart: shoppingCart, item: makeCartItem(name: "shoes", price: 3.45))
        
        var total = calcTotal(cart: shoppingCart)
        setCartTotalDom(total: total)
        updateShippingIcons(cart: shoppingCart)
        updateTaxDom(total: total)
    }
    
    // A
    func updateShippingIcons(cart: [Item]) {
        func getBuyButtonsDom() -> [Button] { [] }
        
        var buyButtons = getBuyButtonsDom()
        for button in buyButtons {
            
            // 추가할 제품이 들어있는 새 장바구니 (담게된다면 새장바구니로 무료배송인지 판별)
            var newCart = addItem(
                cart: cart,
                item: makeCartItem(
                    name: button.item.name,
                    price: button.item.price
                )
            )
            
            if getFreeShopping(cart: newCart) {
                button.showFreeShippingIcon()
            } else {
                button.hideFreeShippingIcon()
            }
        }
    }

    // A
    func updateTaxDom(total: Double) {
        setTaxDom(price: calcTax(amount: total))
    }
    
    func setCartTotalDom(total: Double) {
        
    }
    
    // C
    // 함수가 Item의 구조를 모르도록
    func addItem(
        cart: [Item],
        item: Item
    ) -> [Item] {
        var newCart = cart
        newCart.append(item)
        return newCart
    }
    
    func makeCartItem(name: String, price: Double) -> Item {
        return .init(name: name, price: price)
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
    func getFreeShopping(cart: [Item]) -> Bool {
        return calcTotal(cart: cart) >= 20
    }
    
    // C
    func calcTax(amount: Double) -> Double {
        return amount * 0.10
    }
}

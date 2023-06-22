//
//  Problem.swift
//  FPPractice
//
//  Created by Mason on 2023/06/21.
//

import Foundation

struct Item {
    let name: String
    let price: Double
}

var shoppingCart = [Item]()
var shoppingCartTotal: Double = 0

func addItemToCart(name: String, price: Double) {
    shoppingCart.append(
        .init(
            name: name,
            price: price
        )
    )
    
    calcCartTotal()
}

func calcCartTotal() {
    shoppingCartTotal = 0
    for item in shoppingCart {
        shoppingCartTotal += item.price
    }
    
    setCartTotalDom()
    updateShippingIcons()
    updateTaxDom()
}

struct Button {
    let item: Item
    
    func showFreeShippingIcon() { }
    func hideFreeShippingIcon() { }
}

func updateShippingIcons() {
    func getBuyButtonsDom() -> [Button] { [] }
    let buyButtons = getBuyButtonsDom()
    for buyButton in buyButtons {
        if buyButton.item.price + shoppingCartTotal >= 20 {
            buyButton.showFreeShippingIcon()
        } else {
            buyButton.hideFreeShippingIcon()
        }
    }
}

func setCartTotalDom() { }

func updateTaxDom() {
    setTaxDom(price: shoppingCartTotal * 0.10)
}

func setTaxDom(price: Double) { }

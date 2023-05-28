//
//  ViewController.swift
//  FPSample
//
//  Created by Mason on 2023/05/28.
//

import UIKit

/*
 - 쿠폰독 서비스
 구독자에게 이메일로 쿠폰을 보내주는 서비스
 10명 이상 추천한 사용자에게는 더 좋은 쿠폰을 보내주기
 */

class CouponDog {
    
    // 1. 구독자DB에서 구독자 데이터 (데이터)
    struct Subscriber {
        let email: String
        let recCount: Int
    }
    
    // 2.  쿠폰 등급 (데이터)
    // 쿠폰 등급은 문자열이다.
    // var rank1 = "best"
    typealias CouponRank = String
    
    // 3. 쿠폰 등급 결정 (계산)
    func subCouponBook(subscriber: Subscriber) -> CouponRank {
        if subscriber.recCount >= 10 {
            return "best"
        } else {
            return "good"
        }
    }
    
    // 4. 쿠폰DB에서 쿠폰 데이터 (데이터)
    struct Coupon {
        let code: String
        let rank: CouponRank
    }
    
    // 5. 특정 등급의 쿠폰 목록을 선택 (계산)
    func selectCouponByRank(_ coupons: [Coupon], _ rank: CouponRank) -> [Coupon] {
        var result = [Coupon]()
        for coupon in coupons {
            if coupon.rank == rank {
                result.append(coupon)
            }
        }
        
        return result
    }
    
    // 6. 이메일을 보내기 위한 메시지 (데이터)
    struct Message {
        let from: String
        let to: String
        let subject: String
        let body: String
    }
    
    // 7. 구독자가 받을 이메일을 계획 (계산)
    func emailForSubscriber(subscriber: Subscriber, goods: [Coupon], bests: [Coupon]) -> Message {
        var rank = subCouponBook(subscriber: subscriber)
        if rank == "best" {
            return .init(
                from: "couponDog",
                to: subscriber.email,
                subject: "best coupons",
                body: bests.map { $0.code }.joined()
            )
        } else { // rank == "good"
            return .init(
                from: "couponnDog",
                to: subscriber.email,
                subject: "good coupons",
                body: goods.map { $0.code }.joined()
            )
        }
    }
    
    // 8. 보내일 이메일 목록 준비 (계산)
    func emailsForSubscribers(subscribers: [Subscriber], goods: [Coupon], bests: [Coupon]) -> [Message] {
        return subscribers.map {
            emailForSubscriber(subscriber: $0, goods: goods, bests: bests)
        }
    }
    
    // 9. 이메일 보내기 (액션)
    func sendIssue() {
        let coupons = fetchCouponsFromDB()
        let goodGoodCoupons = selectCouponByRank(coupons, "good")
        let bestCoupons = selectCouponByRank(coupons, "best")
        let subscribers = fetchSubscribersFromDB()
        let emails = emailsForSubscribers(subscribers: subscribers, goods: goodGoodCoupons, bests: bestCoupons)
        
        emails.forEach { sendEmail($0) }
    }
    
    // 10. 사용자가 수백만이라면?
    // 계산은 고치지 않는다는 것이 중요.
    func sendIssue2() {
        let coupons = fetchCouponsFromDB()
        let goodGoodCoupons = selectCouponByRank(coupons, "good")
        let bestCoupons = selectCouponByRank(coupons, "best")
        var page = 0
        var subscribers = fetchSubscribersFromDB(page: page)
        
        while subscribers.count > 0 {
            let emails = emailsForSubscribers(
                subscribers: subscribers,
                goods: goodGoodCoupons,
                bests: bestCoupons
            )
            
            emails.forEach { sendEmail($0) }
            
            page += 1
            subscribers = fetchSubscribersFromDB(page: page)
        }
    }
    
    private func fetchCouponsFromDB() -> [Coupon] {
        return []
    }
    
    private func fetchSubscribersFromDB() -> [Subscriber] {
        return []
    }
    
    private func fetchSubscribersFromDB(page: Int) -> [Subscriber] {
        return []
    }
    
    private func sendEmail(_ email: Message) {
        
    }
}




class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

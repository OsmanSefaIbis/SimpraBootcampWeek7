//
//  ListViewModel.swift
//  week7CoreData
//
//  Created by Sefa İbiş on 17.01.2023.
//

// Pagination BackEnd den datanin bulk seklinde gelmesini kisitlamak icin yapilmakta, genelde next diye belirtilen response datasinda datanin devami icin link verilir oradan devam ettiriceksin, scroll edildikce bu istegi attirabilirsin kisaca
// Api Pagination destegi veriyorsa yapilabilir, birde page sayisi info response datasinda belirtilir ordan hint olarak kullanabilirsin
// Kullanicinin tum datayi indirme durumununun engellenmesi icindir --> Networkten Avantaj 


import Foundation

class ListViewModel{
    
    private let model = ListModel()
    
    // data binding yapmamiz lazim ViewModel ile ViewController arasinda, viewController burada error gostericek 
    var onErrorDetected: ( (String) -> () )?
    var refreshItems: ( ([ListCellModel]) -> () )? // TODO:
    
    // initialize ederken delegate i conform edicegiz
    init(){
        model.delegate = self
    }
    
    func didViewLoad(){
        model.fetchData()
    }
    func itemPressed( _ index: Int){
        // TODO:
    }
    
}
extension ListViewModel: ListModelProtocol{    
    // burada conversion yapmamiz lazim
    func didLiveDataFetch() {
        // TODO:
    }
    func didCacheDataFetch() {
        // TODO:
    }
    func didDataCouldntFetch() {
        // TODO:
    }
}

//
//  ListModel.swift
//  week7CoreData
//
//  Created by Sefa İbiş on 17.01.2023.
//

import Foundation
import Alamofire

protocol ListModelProtocol: AnyObject{
    
    func didLiveDataFetch()
    func didCacheDataFetch()
    func didDataCouldntFetch()
    
}

// Model katmani Data ile ilgili olan katman, datayi ceken, datayi saklayan katman
// Servis katmani olusturup data cekme isini orada yapabilirsin ServiceManager.shared diyip ilgili fetch methodunu cagirmakla oluyor, cekme fonksiyonunu cagiracak yer model olucak ama
// Modelin icinde cache leme yapicagiz
class ListModel{
    
    // burada datalari tutucak DTO:Data Transfer Object, data modelimiz ile coredata modelimiz farkli bu durumlari gozetmen gerekiyor
    
    // burada iki farkli data modelimiz var biri CharacterData apiden decode ettigimiz digeride Core Data da tuttugumuz ListEntity
    // --> bunlarin ya uyumlu olmasi gerekir, yada data corruption durumu olucak uyumu yakalamak icin, ikisine adapter yazilabilir
    // high order func olan map i kullanarak bagimliligi azaltabiliriz api den gelen tarafta, ortak bir model olsun ikisindende cast etsin burdanda o datayi donelim(ViewModel e) yoluda olabilir
    // Mucahit Hocanin yontemi --> ListEntity icinde Binary Data tipinde apiden gelen datayi tutardim sonra db den cek dedigimde o datayi decode edip json a cevirirdim(cast) oyle kullanirdim
    private(set) var data: [CharacterData] = []
    private(set) var databaseData: [ListEntity] = []
    
    // ViewModel a haber vericek
    weak var delegate: ListModelProtocol?
    
    //lalala
    
    
    // if internet varsa apiden istek at ve veri cek
    // else internet yoksa coreData dan al
    func fetchData(){
        if InternetManager.shared.isInternetActive(){
            AF.request("https://rickandmortyapi.com/api/character/?page=1").responseDecodable(of: ApiData.self){ (res) in
                guard let response = res.value
                else{
                    self.delegate?.didDataCouldntFetch()
                    return
                }
                // data model katmanina geldi, view model katmanina delegate ile haber veriliyor
                self.data = response.results ?? []
                self.delegate?.didLiveDataFetch()
            }
        }
        // internet aktif degil o yuzden Core Data fonksiyonlarini cagiriyoruz
        else{
            
        }
        
    }
    
    private func saveToCoreData(){
        // TODO:
    }
    
    public func retrieveFromCoreData(){
        // TODO:
    }
}

//
//  NetworkResult.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/12/02.
//

import Foundation

enum NetworkResult<T> {
    case success(T) //서버 통신 성공했을 때
    case requestErr(T) // 요청 에러 발생했을 때
    case pathErr(T) // 경로 에러 발생했을 때
    case serverErr // 서버의 내부족 에러가 발생했을 때
    case networkFail // 네트워크 연결 실패했을 때
}

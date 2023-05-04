//
//  BaseVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

open class BaseVM: NSObject {

    public let isShowDialogLoading = Box(false)
    public var isLoadingData = false

    public let errorMessage = Box("")
}

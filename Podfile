# Uncomment the next line to define a global platform for your project
platform :ios, '14.3'

use_frameworks!

workspace 'TmdbMVVM-UICode'

inhibit_all_warnings!

target 'domain' do
   # Provide path for module project file
   project './domain/domain.project'

  pod 'RxSwift',    '~> 6.0.0'
end

target 'data' do
   # Provide path for module project file
   project './data/data.project'

  pod 'RxSwift',    '~> 6.0.0'
end

target 'app_framework' do
  project './app_framework/app_framework.project'

  pod 'Alamofire', '~> 5.4.0'
  pod 'Kingfisher', '~> 4.10.1'

  pod 'SwifterSwift', '~> 5.2.0'
  pod 'SwiftyJSON', '~> 5.0.0'

  pod 'RxSwift',    '~> 6.0.0'
end

target 'feature_genre' do
  project './features/feature_genre/feature_genre.project'

  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'RxSwift',    '~> 6.0.0'
end

target 'feature_movie_by_genre' do
  project './features/feature_movie_by_genre/feature_movie_by_genre.project'

  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'RxSwift',    '~> 6.0.0'
end

target 'feature_movie_detail' do
  project './features/feature_movie_detail/feature_movie_detail.project'

  pod 'Kingfisher', '~> 4.10.1'
  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'RxSwift',    '~> 6.0.0'
end

target 'feature_movie_review' do
  project './features/feature_movie_review/feature_movie_review.project'

  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'RxSwift',    '~> 6.0.0'
end

target 'feature_movie_trailer' do
  project './features/feature_movie_trailer/feature_movie_trailer.project'

  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'RxSwift',    '~> 6.0.0'

  pod 'YouTubePlayer'
end

target 'TmdbMVVM-UICode' do
  # Comment the next line if you don't want to use dynamic frameworks
  
  # Pods for TmdbMVVM-UICode
  pod 'Wormholy', '~> 1.6.4', configurations: ['Debug Staging', 'Debug Verify', 'Debug Production']
  pod 'AlamofireNetworkActivityLogger', '~> 3.4', configurations: ['Debug Staging', 'Debug Verify', 'Debug Production']
  pod 'Kingfisher', '~> 4.10.1'

  pod 'SVProgressHUD', '~> 2.2.5'

  pod 'SwifterSwift', '~> 5.2.0'
  pod 'SwiftyJSON', '~> 5.0.0'

  pod 'RxSwift',    '~> 6.0.0'
  
  pod 'Swinject', '2.8.3'

  pod 'YouTubePlayer'
end

target 'TmdbMVVM-UICodeTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'TmdbMVVM-UICodeUITests' do
  # Pods for testing
end

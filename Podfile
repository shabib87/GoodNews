platform :ios, '13.0'

target 'GoodNews' do
  use_frameworks!
  inhibit_all_warnings!
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Kingfisher'
end

plugin 'cocoapods-keys', {
  :project => "GoodNews",
  :targets => ["GoodNews"],
  :keys => [
    "NewsAPIKey"
  ]
}

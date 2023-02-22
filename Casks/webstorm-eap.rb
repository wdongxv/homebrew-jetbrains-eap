cask "webstorm-eap" do
  arch arm: "-aarch64"

  version "2023.1,231.7515.16"
  sha256 arm: "c4e03a7b71c5ee4f4e4c3c0115ceccabbaaaef35970fcc0dbb6cae63ffc6d7cd",
         intel: "cfd0c67414e6e37761620679a4d9dec4a06038d75c31917984638e8eb392253c"

  url "https://download.jetbrains.com/webstorm/WebStorm-#{version.csv.last}#{arch}.dmg"
  name "WebStorm-EAP"
  desc "JavaScript IDE - WebStorm Early Access Program"
  homepage "https://www.jetbrains.com/webstorm/nextversion/"

  livecheck do
    url "https://data.services.jetbrains.com/products/releases?code=WS&latest=true&type=eap"
    strategy :page_match do |page|
      JSON.parse(page)["WS"].map do |release|
        "#{release["version"]},#{release["build"]}"
      end
    end
  end  

  app "WebStorm #{version.csv.first} EAP.app"
end

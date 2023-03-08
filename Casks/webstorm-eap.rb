cask "webstorm-eap" do
  arch arm: "-aarch64"

  version "2023.1,231.7864.77"
  sha256 arm: "3a6e87a80776485a3a3de239293931a0383335d15ce6b008b0d194f083a35099",
         intel: "625cede4e0805ebece09907548d364c21dd78717948de7e7975a9621ba2ef8ff"

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

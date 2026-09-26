class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.1/earnie_0.2.1_darwin_arm64.tar.gz"
      sha256 "00ef823c53b97ee48dbb95e8aa95ff8b9de7f126f37198107d2e3319b5f7afc9"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.1/earnie_0.2.1_darwin_amd64.tar.gz"
      sha256 "8427cdfcdd4321ffbd7ab33623554a122bc02c583136d2a28b47a929a181e590"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.1/earnie_0.2.1_linux_arm64.tar.gz"
      sha256 "dc6bdd640f1b44c43d5b73ae0114e763237fcc11210fa732277a5e048dfa823e"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.1/earnie_0.2.1_linux_amd64.tar.gz"
      sha256 "1b016113b64126462f176c986d0e856635c284a4b96776bf94bab1261f3961a9"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

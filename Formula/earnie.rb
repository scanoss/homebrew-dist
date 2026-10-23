class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.5.0/earnie_0.5.0_darwin_arm64.tar.gz"
      sha256 "015670f4a8a67e991cce191171adcbaaa70f3cdd6b58ccddeb095a4f04fa7b90"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.5.0/earnie_0.5.0_darwin_amd64.tar.gz"
      sha256 "d85aaf7d63c3392ad38eb7cfba14edc1481b7b20a5e8c3ba3b86a973e4263aea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.5.0/earnie_0.5.0_linux_arm64.tar.gz"
      sha256 "da2379ce7926ed7116e0ef127ee6002004396b053d53ec8e61dc9bf5359577a1"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.5.0/earnie_0.5.0_linux_amd64.tar.gz"
      sha256 "523d26d3bd0abfc4c1119a62b224ea3e42825db3512002a99e86ef6404636b52"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.8.0/earnie_0.8.0_darwin_arm64.tar.gz"
      sha256 "25e24aa5eb75464eb0e7bdc81f09edf48128da61b9578484c1ee6305d197f8cf"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.8.0/earnie_0.8.0_darwin_amd64.tar.gz"
      sha256 "2ee612ba174a49bd3db2ddd62d3cc2d2e552f21c67a65a421f7178da2c14ccd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.8.0/earnie_0.8.0_linux_arm64.tar.gz"
      sha256 "60568bf800da578402158e76c2dfcc289f2107a9e2a88df881d4443093db45c5"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.8.0/earnie_0.8.0_linux_amd64.tar.gz"
      sha256 "f8fca9160ffc13225946c3f421c6ed27a6b78886f603d0e9c996a403f5667a97"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

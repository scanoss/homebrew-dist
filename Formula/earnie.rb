class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.3/earnie_0.2.3_darwin_arm64.tar.gz"
      sha256 "3e6f98ce73b481c424d9bd6144d8b1351d961c2cdfceeed90402eb100c58e0e8"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.3/earnie_0.2.3_darwin_amd64.tar.gz"
      sha256 "d6c7c536dd27cb5aa34940db0ec8ef5ef6ff5123d31820ab86bf9198fa57731b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.3/earnie_0.2.3_linux_arm64.tar.gz"
      sha256 "d7cf0fb7301e798e26277c30766baef164671d9d0bb2e58039045eb73c912bfb"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.3/earnie_0.2.3_linux_amd64.tar.gz"
      sha256 "718f0363453243403c876c32dcfebd55a5da387a4526dd00be24f9e903a51df3"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

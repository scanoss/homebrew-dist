class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.0/earnie_0.3.0_darwin_arm64.tar.gz"
      sha256 "6debcbb9eea1ae3118885f0204516a9503a24bb64afaf0fb91befc6cd2b77ae7"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.0/earnie_0.3.0_darwin_amd64.tar.gz"
      sha256 "c1a112d4674c3fcc1a7047c1539cc4869fea1d79a6a6c95153f58dec071e63cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.0/earnie_0.3.0_linux_arm64.tar.gz"
      sha256 "209e031f5b6ea5fb35247701466fed1ca5fd53cad6bc9df400587f30bcd35928"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.3.0/earnie_0.3.0_linux_amd64.tar.gz"
      sha256 "928c75ddd6430565bac6a4336cb9c20c35e23e80321a1f8da27b64722bb177f3"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

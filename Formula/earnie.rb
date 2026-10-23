class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.4.0/earnie_0.4.0_darwin_arm64.tar.gz"
      sha256 "396a22e2c17c72ec1eac0a4d849d927b2203021180daa42243f4bb61d7d92623"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.4.0/earnie_0.4.0_darwin_amd64.tar.gz"
      sha256 "a99cdc5e581f12ba9d3bc6dc9c618c7fb5c6675501127a7279d35729a4821436"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.4.0/earnie_0.4.0_linux_arm64.tar.gz"
      sha256 "9156098f2d719cd61b96facf9d4c324250c0750f00b021c22dc9bf6687b5f198"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.4.0/earnie_0.4.0_linux_amd64.tar.gz"
      sha256 "39b86a7aaff99e0d99af483e8eda25639e31c7f2f99e825ebf088613a0043e42"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

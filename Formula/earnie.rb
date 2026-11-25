class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.11.0/earnie_0.11.0_darwin_arm64.tar.gz"
      sha256 "03838fb5aee2270d44121e3ea5a0579081650226de3263ae139c0e6e2c797ece"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.11.0/earnie_0.11.0_darwin_amd64.tar.gz"
      sha256 "076bb995fe59342b53566635f3bf06d54388f039e5cb9afa5204e2f414845c90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.11.0/earnie_0.11.0_linux_arm64.tar.gz"
      sha256 "19c0496824f2f2fe922cc3b119ba61792c30b62c3ba0b8b28a94a5980f9ab1a6"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.11.0/earnie_0.11.0_linux_amd64.tar.gz"
      sha256 "8d6538c3a579ffb184238808e86b2006c9d4e1e2f498b0eff17a58d8e80072be"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

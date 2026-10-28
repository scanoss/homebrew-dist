class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.6.0/earnie_0.6.0_darwin_arm64.tar.gz"
      sha256 "5743f11c1016ded28976b2f435a2ab8e208ef749d0433afa01e8fc5333ea9728"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.6.0/earnie_0.6.0_darwin_amd64.tar.gz"
      sha256 "f68a38a3a36d45b2c9a04ab756f7e8f623b308f95ff181d48becc5fb879c9634"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.6.0/earnie_0.6.0_linux_arm64.tar.gz"
      sha256 "542bd81d9a452cabd6ce17485a943cd7113f6877f8d76959e33a7955bf8439b8"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.6.0/earnie_0.6.0_linux_amd64.tar.gz"
      sha256 "d6541cf407367bb7d5aa72857f18f94498f47294ea5afe28f792b81b7ab83717"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

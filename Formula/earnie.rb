class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.10.0/earnie_0.10.0_darwin_arm64.tar.gz"
      sha256 "34e66f79f4eef8c32ecd01867051474c7036f458cd981bd919df9001e8182d9a"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.10.0/earnie_0.10.0_darwin_amd64.tar.gz"
      sha256 "d4885181b2f0b47fd98e547a170529216496f7f01b21c75c88495810850ced97"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.10.0/earnie_0.10.0_linux_arm64.tar.gz"
      sha256 "806f13539809e4b2dd388771f5f53f18ffcb184daf6e8076385c02448d704e7f"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.10.0/earnie_0.10.0_linux_amd64.tar.gz"
      sha256 "32b0870ef177c4c850b9b72dc7449d07a00be814342b77ba210f5477befaa56f"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

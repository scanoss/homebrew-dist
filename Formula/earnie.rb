class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.2/earnie_0.2.2_darwin_arm64.tar.gz"
      sha256 "a96d4fa4c89e05632558ec88977ef2075e88ef5a0f6c62a0129a2f4da3a895c6"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.2/earnie_0.2.2_darwin_amd64.tar.gz"
      sha256 "95e064993debc4844d7f0fef9a53dbedd53ac9f1e0fd8631e8490d387d63be0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.2/earnie_0.2.2_linux_arm64.tar.gz"
      sha256 "ab343a2f695bff6acdea192a329f1e7ab8f71496e7f910855065d2ca5ac9c7e5"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.2.2/earnie_0.2.2_linux_amd64.tar.gz"
      sha256 "53acb94f919cdc36c2311399d7f601e54a3c79a2f3855ac760f9fee3d4da23b2"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

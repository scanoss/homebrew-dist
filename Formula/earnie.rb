class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.7.0/earnie_0.7.0_darwin_arm64.tar.gz"
      sha256 "02fee932c065d89f548a14d2a777349e048c34692fe3f62ed2ed6d2e90c8c12c"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.7.0/earnie_0.7.0_darwin_amd64.tar.gz"
      sha256 "e4a78e1f6eafc78af55e7459d10cafb6dbbc7fbf1c130456159b2df77f79d061"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.7.0/earnie_0.7.0_linux_arm64.tar.gz"
      sha256 "967b240dedb63446e2df91a8f45e324a0ba2f107931a923b7be8c0f303420c46"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.7.0/earnie_0.7.0_linux_amd64.tar.gz"
      sha256 "22b1dd4c7dbeb0dd94e1602f1223c0352a12017e3e4099285fe42c6b7921324f"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

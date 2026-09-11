class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.1.1/earnie_0.1.1_darwin_arm64.tar.gz"
      sha256 "a8d0d33d0d484de5b1d08825d57c9b77d7a52466f5f6b173da1dbaf7491e7912"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.1.1/earnie_0.1.1_darwin_amd64.tar.gz"
      sha256 "3b856f2317801162bda53239904f3a0e5ccfab63fe350408bf76b69b193e0650"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.1.1/earnie_0.1.1_linux_arm64.tar.gz"
      sha256 "3d4df9fdcb643e3836d7a44ac3157f9288d6eb16fba6857e0dc3e2e4fadfd478"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.1.1/earnie_0.1.1_linux_amd64.tar.gz"
      sha256 "85edcecec5054daaf0ab382511398e23bfa51d162ba945549adb67ec45e100f7"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end

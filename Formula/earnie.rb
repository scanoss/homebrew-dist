class Earnie < Formula
  desc "Customer CLI for the Earnie software governance platform"
  homepage "https://github.com/scanoss/earnie-cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.9.0/earnie_0.9.0_darwin_arm64.tar.gz"
      sha256 "813c6656f17227894c9e66162123f6bb3b00117daa38bf847081ea33bb7208c9"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.9.0/earnie_0.9.0_darwin_amd64.tar.gz"
      sha256 "950109e6792978fe7e197c75252e3e4835aa717c7475f49bc3950b3cdc1ec8c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.9.0/earnie_0.9.0_linux_arm64.tar.gz"
      sha256 "161b61b44ef5097200b2c23fb161c6a1e3a97a5384bde69343a165968840a411"
    else
      url "https://github.com/scanoss/earnie-cli/releases/download/v0.9.0/earnie_0.9.0_linux_amd64.tar.gz"
      sha256 "b382d5617a71d7aa2f06db225ab3f10640ae7dd22db6e5fac9798b4c205c40c6"
    end
  end

  def install
    bin.install "earnie"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earnie --no-update-check version")
  end
end
